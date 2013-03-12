class ItemsController < ApplicationController
  def index
    if params[:type]
      @item_type = ItemType.where(name: params[:type]).first
      @items = @item_type.items
    else
      @items = Item.all
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to items_path
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    redirect_to items_path
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(params[:item])
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  def events
    # binding.pry
    @item = Item.find(params[:item_id])
    @orders = @item.orders
    render json: { orders: @orders.map(&:to_json) }
  end
end