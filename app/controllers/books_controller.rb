class BooksController < ApplicationController
  def index
    @selected_category = Category.find(params[:cat_id])
    @books = @selected_category.books if @selected_category
    respond_to do |format|
      format.js
    end
  end
end
