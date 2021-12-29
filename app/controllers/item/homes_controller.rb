class Item::HomesController < ApplicationController
  def index
    @homes = ItemHome.all
  end

  def new
    @home = ItemHome.new
  end

  def create
    @home = ItemHome.new(home_params)
    @home.customer_id = current_customer.id
    @home.save!
    redirect_to item_homes_path
  end

  def show
    @home = ItemHome.find(params[:id])
    @item = Item.new
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
end
