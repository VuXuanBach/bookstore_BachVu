class Book < ActiveRecord::Base
  has_and_belongs_to_many :categories
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :author_name, presence: true, length: { maximum: 50 }
  validates :publisher_name, presence: true, length: { maximum: 50 }
  validates :published_date, presence: true
  validates :unit_price, presence: true
end
