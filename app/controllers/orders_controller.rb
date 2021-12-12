class OrdersController < ApplicationController
#before_action :check_cart,only: [:new]
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    # current_customer.cart_items.each do |cart_item|
    # @order_detail = @order.order_details.new(
    #     item_id: cart_item.item_id,
    #     price: cart_item.item.price,
    #     amount: cart_item.amount)
    # @order_detail.save
    # end
    # current_customer.cart_items.destroy_all
    redirect_to public_orders_thanks_path
  end

  def thanks

  end

  def confirm
    @order = Order.new(order_params)
    #@cart_items = current_customer.cart_items
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
