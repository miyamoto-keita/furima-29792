require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての要素が存在すれば登録できること" do

    end

    it "nameが空では登録できないこと" do

    end

    it "emailが空では登録できないこと" do

    end

    it "passwordが空では登録できないこと" do

    end
    
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
    end

    it "birth_dateで空の部分があったら登録できないこと" do
    end

    it "cust_first_nameが空では登録できないこと" do
    end

    it "cust_last_nameが空では登録できないこと" do
    end

    it "first_nameが空では登録できず尚且つカタカナであること" do
    end

    it "last_nameが空では登録できず尚且つカタカナであること" do
    end
  end
end
