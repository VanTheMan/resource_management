class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    params[:order][:start_date] = params[:order][:start_date].to_datetime
    params[:order][:end_date] = params[:order][:end_date].to_datetime
    @order = Order.new(params[:order])
    @order.item = @item
    @order.user = current_user
    if @order.save
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