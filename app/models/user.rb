class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         #association
         #has_many :items
         #has_many :orders

         with_options presence: true do
         validates :nickname
         validates :email
         validates :password
         validates :encrypted_password
         validates :last_name
         validates :first_name
         validates :kana_last_name
         validates :kana_first_name
         validates :birth_day
         end

end
