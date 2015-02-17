class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash['info'] = 'Please check your email to activate your account.'
      redirect_to :root
      # redirect_to @user
    else
      render :new
    end
  end

  def edit

  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(session[:user_id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
