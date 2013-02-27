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
    @item = Item.find(params[:id])

  end
end