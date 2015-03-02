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

  def set_books_catalog_url
    session[:books_catalog_url] = request.url
  end

  def back_to_books_catalog_url
    session[:books_catalog_url] || books_path
  end
end
