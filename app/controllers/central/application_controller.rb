class Central::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'application'

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private
  def record_not_found
    flash[:alert] = 'Wpis nie istnieje'
    redirect_to action: :index
  end

end
