class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :block, :building_name, :phone_number, :purchase_id, :token

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :postcode
    validates :area_id
    validates :city
    validates :block
    validates :phone_number
  end

  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, format: {with: /\A\d{10,11}\z/}
  def save
    # 購入の情報を保存
    purchase = Purchase.create(user_id:user_id, item_id:item_id)
    # 住所の情報を保存
    Address.create(postcode:postcode, area_id:area_id, city:city, block:block, building_name:building_name, phone_number:phone_number,purchase_id:purchase.id)
  end
end