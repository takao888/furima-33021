class UserAddress < ApplicationRecord

  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :address
    validates :phone_number
    validates :prefecture
  end
    # validates :building
    # validates :order

end
