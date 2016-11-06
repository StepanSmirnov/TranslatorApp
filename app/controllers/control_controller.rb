class ControlController < ApplicationController
  rescue_from YandexError, with: :onerror
  helper_method :init_ansver, :init_records, :default_ansver
  before_action :is_logged
	def index
    default_ansver   
	end

  def translate
    init_ansver
    render :index
  end

  def history
    init_records  
  end

private

  def onerror(ex)
    render text:ex.message
  end

  def init_ansver
    @ansver = Main.translate(params) 
  end

  def default_ansver
    @ansver={'lang' => '', 'tolang' => 'ru'}  
  end

  def init_records
    @records = Record.all
  end

  def is_logged
    @session = UserSession.find
    @current_user = @session && @session.user
    redirect_to sign_in_path unless  @current_user
  end
end
