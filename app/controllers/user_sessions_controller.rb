class UserSessionsController < ApplicationController
  helper_method :get_session

  def new
    
  end

  def create
    @session = UserSession.new(session_params)
    if @session.save
      flash[:seccess] = 'Добро пожаловать!'
      redirect_to translate_path
    else
      flash.now[:error] = 'Неверные email или пароль'
      render :new
    end
  end

  def destroy
    current_session.destroy if current_session
    redirect_to sign_in_path
  end

private
  def get_session
    @session ||= UserSession.new  
  end

  def session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end