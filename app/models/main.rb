require 'YandexTranslator'
class Main
  class <<self
    attr_reader :tr
    def translate(args)
      args.update(tr.translate(args['source'], args['tolang']))
      args['text'] = args['text'][0]
      UserSession.find.user.records.create(args.permit(:source, :fromlang, :lang, :text))
      args
    end

    def langs
      if @current_locale != I18n.locale 
        @langs = @tr.getlangs(@current_locale = I18n.locale)['langs']
      else
        @langs ||= @tr.getlangs(@current_locale)['langs']
      end
    end
  end
  @tr = YandexTranslator::YandexTranslator.new('trnsl.1.1.20160907T145726Z.184b07fb1c05d3de.bf989596de0117c3f66b2af3204496f9bdf642ee')
end
