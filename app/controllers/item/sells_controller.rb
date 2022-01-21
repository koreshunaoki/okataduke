class Item::SellsController < ApplicationController
  def index
    @items = Item.all.where(customer_id: current_customer.id, is_deleted: false)
  end


  def new
    if !params[:item][:home_id].blank?
      @home_item = ItemHome.find(params[:item][:home_id])
      if !@home_item.blank?
        @item = Item.new(name: @home_item.name, introduction: @home_item.introduction, category_id: @home_item.category_id)
      else Item.where(item_home_id: params[:item][:home_id]).size > 0
        @item = Item.where(item_home_id: params[:item][:home_id]).first
     
      end
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
    if !params[:item][:item_home_id].blank? && Item.where(item_home_id: params[:item][:item_home_id]).size > 0
      @item = Item.find_by(item_home_id: params[:item][:item_home_id])
      @item.name = params[:item][:name]
      @item.image = params[:item][:image]
      @item.introduction = params[:item][:introduction]
      @item.price = params[:item][:price]
      @item.category_id = params[:item][:category_id]
      @item.customer_id = params[:item][:customer_id]
    else
      @item = Item.new(item_params)
    end
    @item.order_status = :sale
    @item.customer_id = current_customer.id
    if @item.save
      redirect_to item_sells_complete_path(@item)
    else
      render :new
    end
  end

  def complete
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.update(is_deleted: true, order_status: :unknown)
    redirect_to item_buys_path
  end


  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :category_id, :customer_id, :item_home_id)
  end

end
