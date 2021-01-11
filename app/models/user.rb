class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         #association
         #has_many :items
         #has_many :orders

         validates :nickname, presence: true
         validates :email, presence: true
         validates :encrypted_password, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :kana_last_name, presence: true
         validates :kana_first_name, presence: true
         validates :birth_day, presence: true

end
