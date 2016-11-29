class UserSessionsController < ApplicationController
  helper_method :get_session

  def new
   
  end

  def create
    if user_session.save
      flash[:seccess] = t('flash.welcome')
      redirect_to translate_path
    else
      flash.now[:error] = t('flash.error')
      render :new
    end
  end

  def destroy
    current_session.destroy if current_session
    redirect_to sign_in_path(locale: I18n.locale)
  end

private
  def user_session
    @session ||= UserSession.new(session_params)  
  end

  def session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end