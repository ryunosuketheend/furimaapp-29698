class OrdersController < ApplicationController
  before_action :set_item_id, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index]
  def index
    @order = AddressOrder.new
  end
 
  def create
    @order = AddressOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
 
  private
 
  def order_params
    params.permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end
 
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    item = Item.find(params[:item_id])
    redirect_to root_path if item.user_id == current_user.id
    redirect_to root_path if item.order.present?
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end
 end
