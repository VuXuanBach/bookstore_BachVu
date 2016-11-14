class BooksController < ApplicationController
  def index
    if params[:cat_id]
      @selected_category = Category.find(params[:cat_id])
      @books = @selected_category&.books
    elsif params[:search]
      @books = Book.search_by_book_info(params[:search])
    end

    unless @books.any?
      flash.now[:alert] = 'No books found'
    end
  end
end
