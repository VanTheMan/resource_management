class ItemsController < ApplicationController
  def index
    @items = Item.all
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

  end

  def new
    @item = Item.new
  end

  def create

  end
end