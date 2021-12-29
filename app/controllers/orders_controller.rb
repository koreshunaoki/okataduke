class OrdersController < ApplicationController
#before_action :check_cart,only: [:new]
  def index
    @orders = Order.all
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
    @order.save!
    @order.item.update_attribute(:order_status, :purchased)
    redirect_to orders_complete_path
  end


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
    #@order_detail = OrderDetail.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

  # def check_cart
  #   cart_items = current_customer.cart_items
  #   if cart_items.empty?
  #     redirect_to public_cart_items_path
  #   end
  # end

end
