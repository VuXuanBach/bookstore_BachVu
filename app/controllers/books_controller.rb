class BooksController < ApplicationController
  def index
    @books_per_page_ranges = (Book.min_book_number_page..Book.max_book_number_page).to_a
    @num_book_per_page = BookService.new(params, session, @selected_category).set_num_book_per_page
    @books = BookService.new(params, session, @selected_category).set_books&.page(params[:page])&.per(@num_book_per_page)

    flash.now[:alert] = 'No books found' if !@books || @books.empty?
  end

  def show
    @book = Book.find(params[:id])
  end
end
