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
    @home.save
    redirect_to item_homes_path
  end

  def show
    @home = ItemHome.find(params[:id])
    @sell = ItemSell.new
  end

  def edit
  end


  def update
  end

  def destroy
  end

  private
  def home_params
    params.require(:item_home).permit(:name, :image, :introduction, :place_to_put)
  end
end
