require 'rails_helper'

RSpec.describe PurchaseShopping, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_shopping = FactoryBot.build(:purchase_shopping)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_shopping).to be_valid
    end
    it 'cityが空だと保存できないこと' do
      @purchase_shopping.city = ""
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include("City can't be blank", "City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @purchase_shopping.address = ""
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include("Address can't be blank", "Address can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shopping.post_code = '1234567'
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'prefecture_codeを選択していないと保存できないこと' do
      @purchase_shopping.prefecture_code = 0
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include('Prefecture code must be other than 0')
    end
    it 'building_nameは空でも保存できること' do
      @purchase_shopping.building_name = nil
      expect(@purchase_shopping).to be_valid
    end
    it 'phone_numberが全角数字だと保存できないこと' do
      @purchase_shopping.phone_number = '５０００'
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include('Phone number is invalid. Input half-width characters.')
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @purchase_shopping.phone_number = '012345678912'
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
    it 'phone_numberに-があると保存できないこと' do
      @purchase_shopping.phone_number = '01234-8912'
      @purchase_shopping.valid?
      expect(@purchase_shopping.errors.full_messages).to include('Phone number is invalid. Input half-width characters.')
    end
  end
end