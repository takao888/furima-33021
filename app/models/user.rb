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
         validates :email, uniqueness: true
         validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\Z/i, message: 'Include both letters and numbers'}
         validates :encrypted_password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i, message: 'Include both letters and numbers'}
         validates :last_name, format: { with: /\A[一-龥]+\z/, message: 'Full-width characters'}
         validates :first_name, format: { with: /\A[一-龥ぁ-ん]/, message: 'Full-width characters'}
         validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
         validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
         validates :birth_day
         end

end
