class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :user_address
  # attr_accessor :token

  with_options presence: true do
  validates :user_id
  validates :item_id
  # validates :token
end
end
