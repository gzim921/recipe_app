require 'rails_helper'

RSpec.describe 'Users' do
  it "creates a User and redirects to the User's page" do
    get '/login'

    post_params = {
      params: {
        user: {
          user_name: 'Gzim Iseni',
          first_name: 'Gzim',
          last_name: 'Iseni',
          email: 'gzimiseni154@gmail.com',
          password: 'gimigimi',
          password_confirmation: 'gimigimi'
        }
      }
    }

    post '/users', post_params

    expect(session[:user_id]).not_to be_nil

    follow_redirect!

    expect(response.body).to include('Gzim Iseni')
    expect(response.body).to include('Gzim')
    expect(response.body).to include('gzimiseni154@gmail.com')
  end

  it 'renders new, when user params are not valid' do
    get '/login'

    post_params = {
      params: {
        user: {
          full_name: '',
          first_name: '',
          last_name: '',
          email: '',
          password: '',
          password_confirmation: ''
        }
      }
    }

    post '/users', post_params

    expect(session[:user_id]).to be_nil
    expect(response.body).not_to include('Gzim Iseni')
  end
end