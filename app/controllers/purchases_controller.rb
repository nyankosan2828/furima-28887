class PurchasesController < ApplicationController
  before_action :move_to_session
  before_action :set_item
  before_action :move_to_item_index

  # 商品購入ページ
  def index
    redirect_to root_path if @item.purchase.presence
    redirect_to root_path if current_user.id == @item.user_id
    @purchase = PurchaseShopping.new
  end

  # 購入者情報の保存
  def create
    @purchase = PurchaseShopping.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_item_index
    redirect_to root_path unless current_user != @item.user
  end

  def purchase_params
    params.require(:purchase_shopping).permit(:post_code, :prefecture_code, :city, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end