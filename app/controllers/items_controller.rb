class ItemsController < ApplicationController
# トップページ
def index
end

#商品出品ページ
def new
  unless user_signed_in?
    redirect_to new_user_session_path
end

# 商品出品時のデータ保存
def create
end

end