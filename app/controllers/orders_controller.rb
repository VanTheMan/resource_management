class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = @item.orders.create(params[:order])
    if @order.save
      # redirect_to root_path
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: { success: true } }
      end
    else
      errors = @order.errors.full_messages.join(", ")
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: { success: false, html: errors } }
      end
    end
  end
end