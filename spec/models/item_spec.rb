require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空では登録できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'status_idが空では登録できないこと' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'delivery_charge_idが空では登録できないこと' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end

    it 'area_idが空では登録できないこと' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it 'delivery_date_id が空では登録できないこと' do
      @item.delivery_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end
  end
end
