class OrdersController < ApplicationController
  #before_action :check_cart, only: [:confirm]
  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def new
    @order = Order.new
    @addresses = current_customer.addresses
    @item_id = params[:sell_id]
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.item_id = params[:order][:sell_id]
    if @order.save
      redirect_to orders_complete_path
      @order.item.update_attribute(:order_status, :purchased)
    else
      redirect_to new_o

  def confirm
    @order = Order.new(order_params)
    @item = Item.find(params[:sell_id])
    if params[:order][:address_option] == "current_customer_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "registered_address"
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
    else
      @order.postal_code = params[:order][:new_postal_code]
      @order.address = params[:order][:new_address]
      @order.name = params[:order][:new_name]
    end
  end


  def show
    @order = Order.find(params[:id])
    #@item = Item.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end



  # def check_cart
  #   @orders = Order.where(name: "?")
  #   if @orders.name.present?
  #   else
  #     redirect_to root_path
  #   end
  # end

end
