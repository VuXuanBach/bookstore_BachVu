class StaticPagesController < ApplicationController
  def index
    @categories = Category.all
    @books_per_page_ranges = (Book.min_book_number_page..Book.max_book_number_page).to_a
  end
end
