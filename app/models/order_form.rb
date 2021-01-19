class Order_form
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number
#  :card_number, :card_exp_month, :card_exp_year, :card_cvc

with_options presence: true do
  validates :postal_code
  validates :prefecture_id
  validates :city
  validates :addresses
  validates :building
  validates :phone_number
end

def save
  
end

end
