class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if @item.purchase.presence
    redirect_to root_path if current_user.id == @item.user_id
    @order = PurchaseShopping.new
  end

  def create
    @order = PurchaseShopping.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    @item = Item.find(params[:item_id])
    params.require(:purchase_shopping).permit(:post_code, :prefecture_code, :city, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end