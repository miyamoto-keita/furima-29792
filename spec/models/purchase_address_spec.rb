require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '住所情報の保存' do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
end

it 'すべての値が正しく入力されていれば保存できること' do
  expect(@purchase_address).to be_valid
end
it 'postcodeが空だと保存できないこと' do
  @purchase_address.postcode = nil
  @purchase_address.valid?
  expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
end
it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
  @purchase_address.postcode = '1234567'
  @purchase_address.valid?
  expect(@purchase_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
end
it 'area_idが空だと保存できないこと' do
  @purchase_address.area_id = nil
  @purchase_address.valid?
  expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
end
it 'cityが空だと保存できないこと' do
  @purchase_address.city = nil
  @purchase_address.valid?
  expect(@purchase_address.errors.full_messages).to include("City can't be blank")
end
it 'blockが空だと保存できないこと' do
  @purchase_address.block = nil
  @purchase_address.valid?
  expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
end
it 'building_nameは空でも保存できること' do
  @purchase_address.building_name = nil
  expect(@purchase_address).to be_valid
end

it 'phone_numberが空だと保存できないこと' do
  @purchase_address.phone_number = nil
  @purchase_address.valid?
  expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
end

it 'phone_numberがハイフンなしでないと登録できないこと' do
  @purchase_address.phone_number = '000-0000-0000'
  @purchase_address.valid?
  expect(@purchase_address.errors.full_messages).to include("Phone number is not a number")
end
end
end
