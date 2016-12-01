class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_session
  before_action :set_locale
  def current_user
    @current_user ||= current_session && current_session.user
  end

  def current_session
    @session ||= UserSession.find
  end

  # def default_url_options
  # { locale: I18n.locale }.merge url_options
  # end

  private

  def set_locale
    I18n.locale = params[:locale] || current_user.try(:locale) || I18n.locale
  end
end
