class UserSessionsController < ApplicationController
  helper_method :initsession
  def new
    init_session
    redirect_to translate_path if UserSession.find
  end

  def create
    init_session(session_params)
    if @session.save
      redirect_to translate_path
    else
      render :new
    end
  end

  def destroy
    @session = UserSession.find
    @session.destroy if @session
    redirect_to sign_in_path
  end

private

  def session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end

  def init_session(args = nil)
    @session = UserSession.new(args)
  end
end