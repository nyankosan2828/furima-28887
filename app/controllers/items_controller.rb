class ItemsController < ApplicationController
  before_action :move_to_session, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

 # トップページ
 def index
  @items = Item.all.order(created_at: 'DESC')
 end

 #商品出品ページ
 def new
   @item = Item.new
 end

 # 商品出品時のデータ保存
 def create
   @item = Item.new(item_params)
   if @item.save
     redirect_to root_path
   else
    render :new
   end
 end

 # 商品詳細ページ
 def show
 end

 # 商品編集ページ
 def edit
   redirect_to root_path unless current_user  == @item.user
 end

 # 商品情報の更新
 def update
  if @item.update(item_params)
    redirect_to item_path(item_params)
  else
    render :edit
  end
end

# 商品の削除
def destroy
  redirect_to root_path unless current_user == @item.user
  if @item.destroy
    redirect_to root_path
  else
    render 'show'
  end
end

 private

 def move_to_session
   redirect_to new_user_session_path unless user_signed_in?
 end

 # idに紐づく商品データの取得
 def set_item
   @item = Item.find(params[:id])
 end

 def item_params
   params.require(:item).permit(:image, :name, :description, :price, :product_status_id, :postage_payer_id, :prefecture_code_id, :handling_time_id, :category_id).merge(user_id: current_user.id)
 end
end