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
    redirect_to item_sells_complete_path
  end

  def show
    @sell = ItemSell.find(params[:id])
  end

  def edit
    @sell = ItemSell.find(params[:id])
  end


  def update
    @sell = ItemSell.find(params[:id])
    if @sell.update(sell_params)
      redirect_to item_sell_path(@sell)
    else
      render :edit
    end
  end
  
  def destroy
    @sell = ItemSell.find(params[:id])
    @sell.destroy
    redirect_to item_sells_path
  end
  
  
  def complete
    @sell = ItemSell.find(params[:id])
  end
  
  
  
  private
  def sell_params
    params.require(:item_sell).permit(:name, :image, :introduction, :price)
  end

end
