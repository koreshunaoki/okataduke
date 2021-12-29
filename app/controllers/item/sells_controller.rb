class Item::SellsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    if params[:item][:home_id]
      home_item = ItemHome.find(params[:item][:home_id])
      @item = Item.new(name: home_item.name, introduction: home_item.introduction, category_id: home_item.category_id)
    else
      @item = Item.new
    end
    @category_parent = Category.where("ancestry is null")
  end

  # def category_children
  #   @category_children = Category.find("#{params[:parent_id]}").children
  # end

  # def category_grandchildren
  #   @category_grandchildren = Category.find("#{params[:child_id]}").children
  # end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    @item.save
    redirect_to item_buys_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def complete
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    #redirect_to item_sells_path
  end


  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :category_id, :customer_id)
  end

end
