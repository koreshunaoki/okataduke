class Item::BuysController < ApplicationController
  def index
    @items = Item.where(is_deleted: false)
    @q = Item.ransack(params[:q])
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
    @q = Item.ransack(params[:q])
    selection = params[:keyword]
    @items = Item.sort(selection,params[:word],params[:search])
  end

  def search
    @q = ItemHome.ransack(params[:q])
    @items = Item.looks(params[:search], params[:word], params[:sale_status])
    @items = sort_at(@items,params[:keyword])
  end

  def category
    @q = Item.ransack(params[:q])
    @items = @q.result
    #@items = Item.where(category_id:Category.where(id:params[:q][:category_id_eq]).or(Cagtegory.where(ancestry: params[:q][:category_id_eq])).pluck(:id))
    #@children = Category.where(ancestry: params[:q][:category_id_eq])
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
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


  def search_category_item
    @q = Item.ransack(params[:q])
  end

  def sort_at(items, selection)
    case selection
    when 'new'
      return items.where(is_deleted: false).order(created_at: :DESC)
    when 'old'
      return items.where(is_deleted: false).order(created_at: :ASC)
    when 'likes'
      # likes > 0
      array1 = items.where(is_deleted: false).where(id: Favorite.group(:item_id).order(Arel.sql('count(item_id) desc')).pluck(:item_id)).where(is_deleted: false)
      # likes = 0
      array2 = items.where(is_deleted: false) - where(id: Favorite.group(:item_id).pluck(:item_id)).where(is_deleted: false)
      return array1 + array2
      #return where(id: Favorite.group(:item_id).order(Arel.sql('count(item_id) desc')).pluck(:item_id)).where(is_deleted: false)
    when 'dislikes'
      array1 = items.where(is_deleted: false). - where(id: Favorite.group(:item_id).pluck(:item_id)).where(is_deleted: false)
      array2 = items.where(is_deleted: false).where(id: Favorite.group(:item_id).order(Arel.sql('count(item_id) asc')).pluck(:item_id)).where(is_deleted: false)
      return array1 + array2
    when 'high'
      return items.where(is_deleted: false).order(price: :DESC)
    when 'low'
      return items.where(is_deleted: false).order(price: :ASC)
    end
  end

end
