class ControlController < ApplicationController
  rescue_from YandexError, with: :onerror
  helper_method :get_answer, :get_records
  before_action :is_logged
	def index

	end

  def translate
    @answer = Main.translate(params)
    render :index
  end

  def history

  end

private

  def onerror(ex)
    render text:ex.message
  end

  def get_answer
    @answer ||= {'lang' => '', 'tolang' => 'ru'}  
  end

  def get_records
    @records ||= current_user.records
  end

  def is_logged   
    redirect_to sign_in_path(locale: I18n.locale) unless current_session
  end
end
