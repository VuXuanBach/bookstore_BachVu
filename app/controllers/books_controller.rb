class BooksController < ApplicationController
  def index
    @selected_category = Category.find(params[:cat_id])
    @books = @selected_category&.books
  end
end
