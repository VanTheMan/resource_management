class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = @item.orders.create!(params[:order])
    if @order.save
      redirect_to root_path
    else
      render 'new'
    end
  end
end