class OrderLine < ActiveRecord::Base
  belongs_to :order
  belongs_to :book

  validates :order, :book, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
