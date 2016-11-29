class Translation < ActiveRecord::Base
  validates :source, presence: true, length: {minimum: 1}
  after_save :add_translation
private
  def add_translation
    update_columns(YandexAPI.translate(source,lang))
  end
end
