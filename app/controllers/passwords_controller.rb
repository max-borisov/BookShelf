class PasswordsController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user.update(password_params)
    render :edit
    # redirect_to '/'
  end

  private
  def set_user
    @user = User.find(session[:user_id])
  end
  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
