class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  helper_method :current_user
  helper_method :current_ability

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end


  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
