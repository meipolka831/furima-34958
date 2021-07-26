class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :statu
  belongs_to :burden
  belongs_to :area
  belongs_to :shipping_date



end
