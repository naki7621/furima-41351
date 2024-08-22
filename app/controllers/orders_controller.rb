class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create, :show]

  def index
    if user_signed_in? && (@item.sold_out? || @item.user_id == current_user.id)
      redirect_to root_path
    elsif !user_signed_in?
      redirect_to new_user_session_path
    else
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    if @item.sold_out? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
