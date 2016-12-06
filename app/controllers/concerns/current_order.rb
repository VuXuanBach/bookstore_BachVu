module CurrentOrder
  extend ActiveSupport::Concern

  private

  def set_order
    if order_id = session[:order_id]
      @order = Order.find(order_id)
    else
      @order = Order.create
      session[:order_id] = @order.id
    end
  end
end
