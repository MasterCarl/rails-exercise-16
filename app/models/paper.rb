class Paper < ActiveRecord::Base
  has_many :authors
  validates :title, presence: true
  validates :venue, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
end
