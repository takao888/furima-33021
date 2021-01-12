class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery


  #association
  belongs_to :user
  #has_one :order

  with_options presence: true do
  validates :name
  validates :description
  validates :category_id, numericality: { other_than: 1 } 
  validates :sales_status_id
  validates :shipping_fee_status_id
  validates :prefecture_id
  validates :scheduled_delivery_id
  validates :price
  validates :user_id
  end
end
