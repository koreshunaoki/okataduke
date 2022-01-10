class SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    if @range == "ItemHome"
      @homes = ItemHome.looks(params[:search], params[:word])
    else
      @items = Item.looks(params[:search], params[:word])
    end
  end
end
