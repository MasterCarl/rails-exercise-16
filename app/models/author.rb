class Author < ActiveRecord::Base
  has_and_belongs_to_many :papers
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :homepage, presence: true
  def name
    "#{first_name} #{last_name}"
  end
end
