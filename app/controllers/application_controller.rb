class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found  

  private

  def user_not_authorized
    flash[:alert ] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def render_not_found
  	render :template => 'layouts/404.html.erb'
  end


end
