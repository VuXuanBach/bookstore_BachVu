class Order < ActiveRecord::Base
  has_many :order_lines, dependent: :destroy
end
