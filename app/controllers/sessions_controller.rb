class SessionsController < ApplicationController
  skip_before_action :authorize, except: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if (user && user.authenticate(params[:session][:password]))
      log_in user
      remember user if params[:session][:remember_me] == '1'
      redirect_to :root
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to :root
  end
end
