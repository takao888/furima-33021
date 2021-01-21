class UserAddress < ApplicationRecord

  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/}
    validates :prefecture_id
    validates :order_id
  end
    # validates :building

end
