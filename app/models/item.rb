class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #association
  belongs_to :user
  #has_one :order
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image


  with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :category_id, numericality: { other_than: 1 } 
  validates :sales_status_id, numericality: { other_than: 1 } 
  validates :shipping_fee_status_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :scheduled_delivery_id, numericality: { other_than: 1 } 
  validates :price, length: {minimum: 3, maxinum: 7},numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }, format: { with: /\A[0-9]+\z/}
  validates :user_id
  end
end
