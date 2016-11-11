class Book < ActiveRecord::Base
  has_and_belongs_to_many :categories

  validates :title, :author_name, :publisher_name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :published_date, presence: true
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_rating_value, numericality: { greater_than_or_equal_to: 0 }
  validates :total_rating_count, numericality: { greater_than_or_equal_to: 0 }
end
