class PurchasesController < ApplicationController
  # 商品購入ページ
  def index
    @item = Item.find(params[:item_id])
  end

  # 購入者情報の保存
  def create
  end

end
