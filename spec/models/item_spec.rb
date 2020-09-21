require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/flag.png')
    end

    it '全ての値が正しく入力されていれば登録できる' do
      expect(@item).to be_valid
    end

    it 'imageが空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では出品できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空では出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category select')
    end

    it 'product_status_idが空では出品できない' do
      @item.product_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Product status select')
    end

    it 'postage_payer_idが空では出品できない' do
      @item.postage_payer_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage payer select')
    end

    it 'prefecture_code_idが空では出品できない' do
      @item.prefecture_code_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture code select')
    end

    it 'handling_time_idが空では出品できない' do
      @item.handling_time_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Handling time select')
    end

    it 'priceが空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥300~¥9,999,999の間でなければ出品できない' do
      @item.price = 10
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが9,999,999円を超える金額では出品できない' do
      @item.price = 10_000_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end