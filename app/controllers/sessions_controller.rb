class SessionsController < ApplicationController
  skip_before_action :authorize, except: [:destroy]
  before_filter :check_user, except: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if (user && user.authenticate(params[:session][:password]))
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_url
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to signin_url
      end
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to :root
  end

  private
    def check_user
      redirect_to root_path if logged_in?
    end
end
