class Item::HomesController < ApplicationController
  def index
    @homes = ItemHome.all.where(customer_id: current_customer.id)
    @q = ItemHome.ransack(params[:q])
  end

  def new
    @home = ItemHome.new
  end

  def create
    @home = ItemHome.new(home_params)
    @home.customer_id = current_customer.id
    #@item.order_status = :unknown
    if @home.save
      redirect_to item_homes_path
    else
      render :new
    end
  end

  def sort
    selection = params[:keyword]
    @homes = ItemHome.sort(selection)
  end

  def search
    @homes = ItemHome.looks(params[:search], params[:word])
  end

  def show
    @home = ItemHome.find(params[:id])
    @item = Item.find_by(item_home_id: @home.id)
  end


  def category
    @q = ItemHome.ransack(params[:q])
    @homes = @q.result
    #@items = Item.where(category_id:Category.where(id:params[:q][:category_id_eq]).or(Cagtegory.where(ancestry: params[:q][:category_id_eq])).pluck(:id))
    #@children = Category.where(ancestry: params[:q][:category_id_eq])
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
  end

  def edit
    @home = ItemHome.find(params[:id])
  end

  def update
    @home = ItemHome.find(params[:id])
    #@home.item_id = .id
    if @home.update(home_params)
      redirect_to item_home_path(@home)
    else
      render :edit
    end
  end

  def destroy
    @home = ItemHome.find(params[:id])
    @home.destroy
    redirect_to item_homes_path
  end

  private
  def home_params
    params.require(:item_home).permit(:name, :image, :introduction, :place_to_put, :category_id)
  end

  def search_category_item
    @q = ItemHome.ransack(params[:q])
  end
end
