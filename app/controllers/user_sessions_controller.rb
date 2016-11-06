class UserSessionsController < ApplicationController
  def new
    @session = UserSession.new
  end

  def create
    @session = UserSession.new(session_params)
    if @session.save
      redirect_to translate_path
    else
      render :new
    end
  end

  def destroy
    @session = UserSession.find
    @session.destroy
    redirect_to 'new'
  end

private

  def session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end