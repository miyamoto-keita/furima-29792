class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  validates :name, presence: true, length: { maximum: 40 }
  with_options presence: true do
    NAME_REGEX = /[ぁ-んァ-ン一-龥]+\z/.freeze
    NAME_KANA_REGEX = /\A[ァ-ン]/.freeze
    validates :first_name, format: { with: NAME_KANA_REGEX, message: 'is invaliInput full-width characters.' }
    validates :last_name, format: { with: NAME_KANA_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :cust_first_name, format: { with: NAME_REGEX }
    validates :cust_last_name, format: { with: NAME_REGEX }
    validates :birth_date
  end
end
