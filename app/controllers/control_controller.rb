class ControlController < ApplicationController
  rescue_from YandexError, with: :onerror
  helper_method :get_ansver, :get_records
  before_action :is_logged
	def index

	end

  def translate
    @ansver = Main.translate(params)
    render :index
  end

  def history

  end

private

  def onerror(ex)
    render text:ex.message
  end

  def get_ansver
    @ansver ||= {'lang' => '', 'tolang' => 'ru'}  
  end

  def get_records
    @records ||= Record.all
  end

  def is_logged
    @session = UserSession.find
    @current_user = @session && @session.user
    redirect_to sign_in_path unless  @current_user
  end
end
