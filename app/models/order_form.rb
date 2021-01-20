class OrderForm
  include ActiveModel::Model
  attr_accessor :card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture_id, :city, :building, :phone_number, :address


  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :address
    validates :phone_number
    validates :prefecture
    validates :card_number
    validates :card_exp_month
    validates :card_exp_year
    validates :card_cvc
  end
    #validates :building

    def save
      order = Order.create
      User_address.create(postal_code: postal_code, city: city, address: address, phone_number: phone_number, prefecture: prefecture)
    end
end
