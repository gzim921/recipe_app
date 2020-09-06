require 'rails_helper'

RSpec.describe 'Recipes' do
  describe 'Creating a recipe' do
    context "when no user is logged in" do
      it 'redirects back to login path' do

        post_params = {
          params: {
            recipe: {
              title: 'Gzim Iseni',
              description: 'Gzim'
            }
          }
        }

        post '/recipes', post_params

        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'Editing a recipe' do
    context "when the recipe's user is the same as the logged in User" do
      let(:user) { create(:user) }
      let(:recipe) { create(:recipe, user: user) }

      it 'can edit the recipe' do
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

        get "/recipes/#{recipe.id}/edit"

        expect(response).to have_http_status(:ok)

        patch_params = {
          params: {
            recipe: {
              title: recipe.title,
              description: "New description"
            }
          }
        }

        patch "/recipes/#{recipe.id}", patch_params

        expect(response).to have_http_status(:found)

        follow_redirect!

        expect(response.body).to include(recipe.title)
        expect(response.body).to include("New description")
      end
    end

    context "when no user is logged in" do
      let(:recipe) { create(:recipe) }

      it 'redirect back to login path when trying to edit cocktail' do
        get "/recipes/#{recipe.id}/edit"

        expect(flash[:danger]).to eq "Please log in to continue!"
        expect(response).to redirect_to(login_path)
      end

      it 'redirect back to login path when trying to update a cocktail' do
        patch_params = {
          params: {
            recipe: {
              title: recipe.title,
              description: "New cocktail"
            }
          }
        }

        patch "/recipes/#{recipe.id}", patch_params

        expect(flash[:danger]).to eq "Please log in to continue!"
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'Deleting a recipe' do
    context "when the recipe's user is the same as the logged in User" do
      let(:user) { create(:user) }
      let(:recipe) { create(:recipe, user: user) }

      it 'can delete the recipe' do
        get '/login'

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

        delete "/recipes/#{recipe.id}"

        expect(response).to redirect_to(root_path)
      end
    end

    context "when no user is logged in" do
      let(:recipe) { create(:recipe) }

      it 'redirect back to login path' do
        delete "/recipes/#{recipe.id}"

        expect(flash[:danger]).to eq "Please log in to continue!"
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
