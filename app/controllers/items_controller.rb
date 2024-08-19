class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :condition_id, :delivery_charge_id, :area_id, :days_to_ship_id, :price)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
