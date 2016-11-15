class UserSessionsController < ApplicationController
  helper_method :get_session

  def new
   
  end

  def create
    get_session(session_params)
    if @session.save
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
  def get_session(args = nil)
    @session ||= UserSession.new(args)  
  end

  def session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end