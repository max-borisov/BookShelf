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

end
