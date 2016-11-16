class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  MIN_RATING = 0
  MAX_RATING = 5

  default_scope { order(commented_time: :desc) }
  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, :book_id, presence: true
end
