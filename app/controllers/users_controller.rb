class UsersController < ApplicationController
  skip_before_action :require_login
  before_action :is_user_present?, except: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def is_user_present?
    if current_user_present?
      flash[:danger] = 'Already logged in!'
      redirect_to user_path(@current_user) and return
    end
  end
end
