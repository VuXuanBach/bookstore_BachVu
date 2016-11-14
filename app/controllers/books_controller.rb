class BooksController < ApplicationController
  def index
    if params[:cat_id]
      @selected_category = Category.find(params[:cat_id])
      session[:selected_category_id] = @selected_category&.id
      @books = @selected_category&.books&.page(params[:page])&.per(@num_book_per_page ? @num_book_per_page : Book.max_book_number_page)
    elsif params[:search]
      @books = Book.search_by_book_info(params[:search])&.page(params[:page])&.per(@num_book_per_page ? @num_book_per_page : Book.max_book_number_page)
    end

    if params[:num] && @books
      @num_book_per_page = params[:num]
      @books = @books&.page(params[:page])&.per(@num_book_per_page)
    end

    flash.now[:alert] = 'No books found' if !@books || @books.empty?
  end
end
