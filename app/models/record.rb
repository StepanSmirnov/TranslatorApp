class Record < ActiveRecord::Base
  validates :source, presence: true, length: {minimum: 1}
end
