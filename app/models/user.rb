class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 40 }
  with_options presence: true do
    validates :first_name, format: { with: /\A[ァ-ン]/,message: "is invaliInput full-width characters."}
    validates :last_name, format: { with: /\A[ァ-ン]/,message: "is invalid. Input full-width characters."}
    validates :cust_first_name, format: { with: /[ぁ-んァ-ン一-龥]+\z/}
    validates :cust_last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :birth_date
    #validates :cust_first_name, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
    #validates :cust_last_name, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  end
end
    
  
