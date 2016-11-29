class YandexAPI
  $translator = YandexTranslator::YandexTranslator.new(ENV['apikey'])
  class <<self
    def translate(source, lang)
      translation = $translator.translate(source, lang)
      { text: translation['text'][0], fromlang: translation['lang'].split('-').first }
    end

    def langs
      @langs = $translator.getlangs(@last_locale = I18n.locale)['langs'] if @last_locale != I18n.locale
      @langs
    end
  end
end
