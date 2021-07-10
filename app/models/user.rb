class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,:password_confirmation,format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  with_options presence: true do
    validates :nickname
    validates :surname,
              format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :name, 
              format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :surnamekana, 
              format:{ with: /\A[ァ-ヶー－]+\z/}
    validates :namekana, 
              format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
         
  has_many :products
  has_many :buys
end


