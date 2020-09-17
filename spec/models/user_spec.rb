require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が無い場合は登録できない" do
        @user.email = "abcdef.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password
        @user.valid?
        expect(errors.full_messages).to include("Password can't be blank", "Password cofirmation doesn't match Password")
      end
      it "passwordが6文字以下では登録できない" do
        @user.password = "12345"
        @user.password_cofirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合で無いと登録できない" do
        @user.password = "1234567"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password It is invalid. input both letters and numbers.")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_cofirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

    end
    describe '本人情報確認' do
      it "ユーザー名の名字が空だと新規登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name can't be blank", "Family_name is invalid. Input full-width characters.")
    end
    it "ユーザー名の名前が空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid. Input full-width characters.")
    end
    it "ユーザー名が半角だと新規登録できない" do
      @user.family_name = "ﾔﾏﾀﾞ"
      @user.first_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.", "First name is invalid. Input full-width characters.")
    end
    it "ユーザー名の名字(フリガナ)が空だと登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid. Input full-width katakana characters.")
    end
    it "ユーザー名の名前(フリガナ)が空だと登録できない" do
      @uset.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid. Input full-width katakana characters.")
    end
    it "生年月日が空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday Can't be blank")
    end
  end
end