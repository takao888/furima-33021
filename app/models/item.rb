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
  validates :name
  validates :description
  validates :category_id, numericality: { other_than: 1, message: "Select" } 
  validates :sales_status_id, numericality: { other_than: 1, message:"Select" } 
  validates :shipping_fee_status_id, numericality: { other_than: 1, message:"Select" } 
  validates :prefecture_id, numericality: { other_than: 1, message:"Select" }
  validates :scheduled_delivery_id, numericality: { other_than: 1, message:"Select" } 
  validates :price
  validates :user_id
  end

  validates_inclusion_of :price, in: 300..9_999_999, message: "Out of setting range"
  #validates :price, format: { with: /\A[0-9]+\z/, message:"Half-width number" }
end
