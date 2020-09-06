class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = 'Successfully logged in!'
      redirect_to user
    else
      flash[:danger] = 'Invalid combination of email or password!'
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
