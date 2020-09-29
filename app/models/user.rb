class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchaes
  
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  NAME_REGEX_KANA = /\A[ァ-ヶー－]+\z/
  PASSWORD_REGEX =  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :password_confirmation
    validates :first_name, format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :family_name, format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :first_name_kana, format: { with: NAME_REGEX_KANA, message: 'is invalid. Input full-width katakana characters.' }
    validates :family_name_kana, format: { with: NAME_REGEX_KANA, message: 'is invalid. Input full-width katakana characters.' }
    validates :birthday
  end

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'need to include @' }
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

end