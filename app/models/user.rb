class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true
  validates :surname, presence: true
  validates :name, presence: true
  validates :surnamekana, presence: true
  validates :namekana, presence: true
  validates :birthday, presence: true
         
  has_many :products
  has_many :buys
end
