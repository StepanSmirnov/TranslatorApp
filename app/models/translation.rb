class Translation < ActiveRecord::Base
  validates :source, presence: true, length: {minimum: 1}
  before_save :add_translation
private
  def add_translation
    attributes.merge!(
      if existing = Translation.find_by(source: source, lang: lang)
        existing.attributes.extract!('text', 'fromlang')
      else
        translation = YandexAPI.translate(source,lang)
      end
    )
  end
end
