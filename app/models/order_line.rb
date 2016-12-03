class OrderLine < ActiveRecord::Base
  belongs_to :order
  belongs_to :book

  validates :order_id, :book_id, presence: true
end
