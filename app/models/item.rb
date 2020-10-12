class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_date
  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :category
    validates :status
    validates :delivery_charge
    validates :area
    validates :delivery_date
    validates :image
  end
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates_inclusion_of :price, in: 300..9_999_999
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
end
