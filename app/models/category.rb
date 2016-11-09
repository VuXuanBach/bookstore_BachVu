class Category < ActiveRecord::Base
  default_scope { order(sort_order: :asc) }
end
