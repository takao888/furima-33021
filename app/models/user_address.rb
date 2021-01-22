class UserAddress < ApplicationRecord

  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "Select"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /0[789]0\d{4}\d{4}/, message:"Input only number"}
    validates :order_id
  end
end
