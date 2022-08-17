class Item::HomesController < ApplicationController
  before_action :correct_user, only: [:show, :destroy, :edit, :update]
  def index
    @homes = ItemHome.all.where(customer_id: current_customer.id)
    @q = ItemHome.ransack(params[:q])
  end

  def new
    @home = ItemHome.new
    @category_parent = Category.where("ancestry is null")
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
    @q = ItemHome.ransack(params[:q])
    selection = params[:keyword]
    @homes = ItemHome.sort(selection,params[:word],params[:search]).where(customer_id: current_customer.id)
  end

  def search
    @q = ItemHome.ransack(params[:q])
    @homes = ItemHome.looks(params[:search], params[:word]).where(customer_id: current_customer.id)
  end

  def show

    @home = ItemHome.find(params[:id])
    @item = Item.find_by(item_home_id: @home.id)
  end


  def category
    @q = ItemHome.ransack(params[:q])
    @homes = @q.result.where(customer_id: current_customer.id)
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
  end

  def edit
    @home = ItemHome.find(params[:id])
  end

  def update
    @home = ItemHome.find(params[:id])
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

  def correct_user
    @home = ItemHome.find(params[:id])
    @homes = ItemHome.all.where(customer_id: current_customer.id)
    if !@homes.include?(@home)
      redirect_to root_path
    end
  end
end
