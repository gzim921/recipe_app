class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :require_login

  private

  def require_login
    unless current_user_present?
      flash[:danger] = 'Please log in to continue!'
      redirect_to login_path
    end
  end
end
