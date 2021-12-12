class Item::SellsController < ApplicationController
  def index
    @sells = Item::Sell.all
  end

  def new
    @item_sell = Item::Sell.new
  end

  def create
    @sell = Sell.new(sell_params)
    @sell.customer_id = current_customer.id
    @sell.save
    redirect_to item_sells_path
  end

  def show
  end

  def edit
  end

  def complete
  end



  def update
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:name, :image_id, :introduction, :price)
  end

end
