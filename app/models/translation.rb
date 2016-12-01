class Translation < ActiveRecord::Base
  validates :source, presence: true, length: { minimum: 1 }
  after_save :add_translation

  private

  def add_translation
    update_columns(
      if existing = Translation.where('source = ? and lang = ?', source, lang).where('text != ""').first
        existing.attributes.extract!('text', 'fromlang')
      else
        YandexAPI.translate(source, lang)
      end
    )
  end
end
