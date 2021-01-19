class UserAddress < ApplicationRecord

  belongs_to :order
  
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
    validates :prefecture
  end
    # validates :building
    # validates :order

end
