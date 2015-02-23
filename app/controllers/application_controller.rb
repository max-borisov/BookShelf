class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  before_action :authorize

  protected
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to signin_url, flash: { warning: 'Please log in' }
      end
    end

    def check_admin
      redirect_to root_path unless current_user.admin?
    end

  def record_not_found
    redirect_to root_path, flash: { danger: 'Record not found.' }
  end
end
