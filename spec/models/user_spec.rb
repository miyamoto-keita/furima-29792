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

    it "emailは@がないと登録できないこと" do
      @user.email = "sample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
        another_user.email =  @user.email         
      another_user.valid?
      expect(another_user.errors.full_messages). to include("Email has already been taken")
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
    
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが英字のみでは登録できないこと" do
      @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが数字のみでは登録できないこと" do
      @user.password = "123456"
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

    it 'cust_first_nameが全角日本語でないと保存できないこと' do
    @user.cust_first_name = "tarou"
    @user.valid?
    expect(@user.errors.full_messages).to include("Cust first name is invalid")
    end

    it 'cust_last_nameが全角日本語でないと保存できないこと' do
      @user.cust_last_name = "satou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Cust last name is invalid")
      end

      it "first_nameが空では登録できないこと" do
        @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameがカタカナでないと登録できないこと" do
      @user.first_name = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invaliInput full-width characters.")
    end

      it "last_nameが空では登録できないこと" do
      @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameがカタカナでないと登録できないこと" do
      @user.last_name = "すずき"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
  end
end
