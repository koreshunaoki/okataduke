class Item::FavoritesController < ApplicationController
  def create
    item = Item.find(params[:buy_id])
    favorite = current_customer.favorites.new(item_id: item.id)
    fav
    redirect_to item_buy_path(item.id)
  end

  def destroy
    item = Item.find(params[:buy_id])
    favorite = current_customer.favorites.find_by(item_id: item.id)
    favorite.destroy
    redirect_to item_buy_path(item.id)
  end
end
