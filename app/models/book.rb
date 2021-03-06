class Book < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :comments
  has_many :order_lines

  before_destroy :ensure_not_referenced_by_any_order_line

  validates :title, :author_name, :publisher_name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :published_date, presence: true
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_rating_value, numericality: { greater_than_or_equal_to: 0 }
  validates :total_rating_count, numericality: { greater_than_or_equal_to: 0 }

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.jpg'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  include PgSearch
  pg_search_scope :search_by_book_info, against: [:title, :author_name], using: { tsearch: { any_word: true } }

  def self.max_book_number_page
    10
  end

  def self.min_book_number_page
    1
  end

  def average_rating
    comments.average(:rating)&.round || 0
  end

  private

  def ensure_not_referenced_by_any_order_line
    if order_lines.empty?
      true
    else
      errors.add(:base, 'Book exists in order')
      false
    end
  end
end
