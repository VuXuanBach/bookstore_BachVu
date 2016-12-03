class OrderLinesController < ApplicationController
  include CurrentOrder

  before_action :set_order, only: [:create]
  before_action :set_order_line, only: [:show, :edit, :update, :destroy]

  def create
    book = Book.find_by(id: params[:book_id])
    @order_line = @order.order_lines.build(book: book)
    if @order_line.save
      flash.now[:success] = 'Book is added to order successfully'
    else
      flash.now[:error] = 'Book is not added to order'
    end
  end
end
