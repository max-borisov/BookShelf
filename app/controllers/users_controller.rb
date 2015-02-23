class UsersController < ApplicationController
  before_action :check_admin, only: [:index]
  before_action :set_user, only: [:destroy]

  def index
    @users = User.all.order('id ASC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash['info'] = 'Please check your email to activate your account.'
      redirect_to :root
    else
      render :new
    end
  end

  def edit
  end

  def show
    # Users can't view other user's profiles
    if check_access_to_profile
      @user = User.find(params[:id])
    else
      redirect_to user_path(current_user.id)
    end
  end

  def destroy
    # Only current user or admin can delete account
    if current_user.id == @user.id
      @user.destroy
      log_out
      redirect_to users_path, flash: { success: "User account has been deleted." }
    else if current_user.admin?
      @user.destroy
      redirect_to users_path, flash: { success: "User account has been deleted." }
    else
      redirect_to root_url
    end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def check_access_to_profile
      params[:id] == current_user.id.to_s
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
