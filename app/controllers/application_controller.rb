class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_session
  
  def current_user
    @current_user ||= current_session && current_session.user  
  end

  def current_session
  	@session ||= UserSession.find
  end
end
