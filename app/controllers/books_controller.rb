class BooksController < ApplicationController
  def index
    @selected_category = CategoryService.new(params, session).set_selected_category
    @num_book_per_page = BookService.new(params, session, @selected_category).set_num_book_per_page
    @books = BookService.new(params, session, @selected_category).set_books&.page(params[:page])&.per(@num_book_per_page)

    flash.now[:alert] = 'No books found' if !@books || @books.empty?
  end
end
