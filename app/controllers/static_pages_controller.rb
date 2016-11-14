class StaticPagesController < ApplicationController
  def index
    @categories = Category.all
    @books_per_page_ranges = (1..10).to_a
  end
end
