class Item::BuysController < ApplicationController
  def index
    @items = Item.all
    #@items = Item.where.not(id: Order.pluck(:item_id))
  end

  def new
    @item = Item.new
    @category_parent = Category.where("ancestry is null")
  end

  def category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    @item.save
    redirect_to item_buys_path
  end


  def show
    #binding.pry
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :category_id, :customer_id)
  end

end
