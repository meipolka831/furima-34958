class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :detail
    validates :money
    validates :user_id

      with_options numericality: { other_than: 1 , message: "can't be blank"}do
        validates :status_id
        validates :burden_id
        validates :area_id
        validates :shipping_date_id
        validates :category_id
      end

  end

  belongs_to :user
  has_one_attached :image
end
