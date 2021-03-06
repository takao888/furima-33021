class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :building, :phone_number, :address, 
  :user_id, :order_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "Select"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message:"Input only number"}
    validates :token
    validates :user_id
    validates :item_id
    end

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      UserAddress.create(postal_code: postal_code, city: city, address: address, phone_number: phone_number, prefecture_id: prefecture_id, building: building, order_id: order.id)
    end
end

