require 'rails_helper'

RSpec.describe 'Instructions' do
  describe 'Editing a instruction' do
    context "when the recipe's instruction user is the same as the logged in User" do
      let(:user) { create(:user) }
      let(:recipe) { create(:recipe, user: user) }
      let(:instruction) { create(:instruction, recipe: recipe) }

      it 'can edit the recipe instructions' do
        get '/login'

        expect(response).to have_http_status(:ok)

        post_params = {
          params: {
            session: {
              user_name: user.user_name,
              email: user.email,
              password: user.password
            }
          }
        }

        post '/login', post_params

        follow_redirect!

        expect(flash[:success]).to eq 'Successfully logged in!'

        get "/recipes/#{recipe.id}/edit_instructions"

        patch_params = {
          params: {
            recipe: {
              instructions: {
                body: instruction.body
              }
            }
          }
        }

        patch "/recipes/#{recipe.id}", patch_params

        expect(response).to have_http_status(:found)

        follow_redirect!

        expect(response.body).to include('Melt the butter in a skillet over medium heat')
      end
    end

    context "when no user is logged in" do
      let(:recipe) { create(:recipe) }
      let(:instruction) { create(:instruction, recipe: recipe) }

      it 'redirect back to login path when trying to edit an instructions' do
        get "/recipes/#{recipe.id}/edit_instructions"

        expect(flash[:danger]).to eq "Please log in to continue!"
        expect(response).to redirect_to(login_path)
      end

      it 'redirect back to login path when trying to update an instructions' do
        patch_params = {
          params: {
            recipe: {
              instructions: {
                body: instruction.body
              }
            }
          }
        }

        patch "/recipes/#{recipe.id}", patch_params

        expect(flash[:danger]).to eq "Please log in to continue!"
        expect(response).to redirect_to(login_path)
      end
    end
  end
end