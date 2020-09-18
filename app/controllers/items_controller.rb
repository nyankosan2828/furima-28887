class ItemsController < ApplicationController
  before_action :move_to_session, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # トップ
  def index
  end

  # 商品出品
  def new
    @item = Item.new
  end

  # 出品時のデータ保存
  def create
    @item = Item.new(item_params)
     if @item.save
      @item.update(product_status: false)
       redirect_to root_path
     else
       render action: :new
     end
  end 

  # 商品詳細
  def show
  end

  # 商品編集
  def edit
    redirect_to root_path unless current_user == @item.user
  end

  # 商品情報の更新
  def update
    render action: :show if @item.update(item_params)
  end

  # 商品の削除
  def destroy
    redirect_to root_path unless current_user == @item.user
    redirect_to root_path if @item.destroy
  end
  
  private

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :postage_payer_id, :prefecture_code_id, :handling_time_id, :category_id,).merge(user_id: current_user)
  end
end