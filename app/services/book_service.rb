class BookService
  attr_reader :params, :session, :selected_category

  def initialize(params, session, selected_category)
    @params = params
    @session = session
    @selected_category = selected_category
  end

  def set_books
    if params[:search]
      Book.search_by_book_info(params[:search])
    else
      selected_category&.books
    end
  end

  def set_num_book_per_page
    if params[:num]
      number = params[:num]
    elsif session[:num_book_per_page]
      number = session[:num_book_per_page]
    else
      number = Book.max_book_number_page
    end
    session[:num_book_per_page] = number
    number
  end
end
