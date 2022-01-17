class Item::BuysController < ApplicationController
  def index
    @items = Item.where(is_deleted: false)
    #@items = Item.where.not(id: Order.pluck(:item_id))
  end

  def new
    @item = Item.new
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
    if @item.save
      redirect_to item_sells_complete_path(@item)
    else
      render :new
    end
  end
  
  def sort
    selection = params[:keyword]
    @items = Item.sort(selection)
  end


  def show
    #binding.pry
    @item = Item.find(params[:id])
    @comment = Comment.new
    @customer = @item.customer
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_buy_path(@item)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :category_id, :customer_id, :keyword)
  end

end
