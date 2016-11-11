class Category < ActiveRecord::Base
  has_and_belongs_to_many :books

  default_scope { order(sort_order: :asc) }
  validates :name, uniqueness: true, presence: true, length: { maximum: 50 }
end
