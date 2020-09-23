require 'rails_helper'

RSpec.describe PurchaseShopping, type: :model do
  describe '購入情報保存機能' do
    before do
      @purchase_shopping = FactoryBot.build(:purchase_shopping)
    end

    it '全ての値が正しく入力されていれば保存できる' do
      expect(@purchase_shopping).to be_valid
    end

    it 'building_nameが空でも保存できる' do
      @purchase_shopping.building_name = nil
      expect(@purchase_shopping).to be_valid
    end

    it 'post_codeが空では保存できないこと' do
      @purchase_shopping.post_code = nil
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include("Post code can't be blank", 'Post code Input correctly')
    end

    it 'post_codeにハイフンが無ければ保存できないこと' do
      @purchase_shopping.post_code = '1234567'
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include('Post code Input correctly')
    end

    it 'prefecture_codeが空では保存できないこと' do
      @purchase_shopping.prefecture_code = nil
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include('Prefecture code select')
    end

    it 'cityが空では保存できないこと' do
      @purchase_shopping.city = nil
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では保存できないこと' do
      @purchase_shopping.address = nil
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空では保存できないこと' do
      @purchase_shopping.phone_number = nil
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが12桁以上では保存できないこと' do
      @purchase_shopping.phone_number = '123456789012'
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
  end
end