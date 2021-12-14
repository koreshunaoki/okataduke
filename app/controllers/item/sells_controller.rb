class Item::SellsController < ApplicationController
  def index
    @sells = ItemSell.all

  end

  def new
    @sell = ItemSell.new
  end

  def create
    @sell = ItemSell.new(sell_params)
    @sell.customer_id = current_customer.id
    @sell.save!
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
  def sell_params
    params.require(:item_sell).permit(:name, :image, :introduction, :price)
  end

end
