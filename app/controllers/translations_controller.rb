class TranslationsController < ApplicationController
  rescue_from YandexError, with: :onerror
  helper_method :translation, :users_translations
  before_action :is_logged
  def index; end

  def new; end

  def create
    users_translations.create(translation_params)
    redirect_to action: 'show'
  end

  def show
    @translation = users_translations.last
    render :new
  end

  private

  def onerror(ex)
    render text: ex.message
  end

  def translation
    @translation ||= Translation.new(translation_params)
  end

  def users_translations
    @translations ||= current_user.translations
  end

  def is_logged
    redirect_to sign_in_path(locale: I18n.locale) unless current_session
  end

  def translation_params
    params[:translation] && params.require(:translation).permit(:source, :lang)
  end
end
