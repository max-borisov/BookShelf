class PasswordsController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(password_params)
      redirect_to password_edit_path, flash: { success: 'Password has been changed.' }
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(session[:user_id])
  end
  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
