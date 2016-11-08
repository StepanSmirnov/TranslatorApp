class Record < ActiveRecord::Base
  validates :source, presence: true, length: {minimum: 1}
  belongs_to :user
end
