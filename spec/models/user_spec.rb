require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "birth_dateが空では登録できないこと" do
      @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end

    it "cust_first_nameが空では登録できないこと" do
      @user.cust_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Cust first name can't be blank")
    end

    it "cust_last_nameが空では登録できないこと" do
      @user.cust_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Cust last name can't be blank")
    end

    it "first_nameがカタカナでないと登録できないこと" do
      @user.first_name = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invaliInput full-width characters.")
    end

    it "last_nameがカタカナでないと登録できないこと" do
      @user.last_name = "すずき"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
  end
end
