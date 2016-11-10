class StaticPagesController < ApplicationController

  def index
    @categories = Category.all
  end

  def get_books_from_category
    @selected_category = Category.find(params[:cat_id])
    @books = books_from_category(@selected_category)
    respond_to do |format|
      format.js
    end
  end
end
