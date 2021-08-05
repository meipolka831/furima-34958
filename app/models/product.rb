class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :detail
    validates :image

      with_options numericality: { other_than: 1 , message: "can't be blank"} do
        validates :status_id
        validates :burden_id
        validates :area_id
        validates :shipping_date_id
        validates :category_id
        
      end

      with_options numericality: { with: /A[0-9a-zA-Z]*z/} do
        validates_inclusion_of :money, in:300..9999999
      end

  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image
end
