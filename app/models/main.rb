require 'YandexTranslator'
class Main
  class <<self
    attr_reader :langs, :tr
    def translate(args)
      args.update(tr.translate(args['source'], args['tolang']))
      args['text'] = args['text'][0]
      Article.find(params[:user_id]).create(args.permit(:source, :fromlang, :lang, :text))
      args
    end  
  end
  @tr = YandexTranslator::YandexTranslator.new('trnsl.1.1.20160907T145726Z.184b07fb1c05d3de.bf989596de0117c3f66b2af3204496f9bdf642ee')
  @langs = @tr.getlangs('ru')['langs']  
end
