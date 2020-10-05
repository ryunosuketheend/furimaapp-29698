class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_one :address
  has_one :order
    
    VALID_PASSWORD_0 =/\A[a-zA-Z0-9]+\z/
    validates :password, 
              format: { with: VALID_PASSWORD_0,
               message: "は半角6文字以上英・大文字・小文字・数字それぞれ１文字以上含む必要があります"}
    validates :nickname, :birthday, :last_name, :last_name_katakana, :first_name, :first_name_katakana,  presence: true
    
    VALID_PASSWORD_1 =/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
    validates :first_name, :last_name, 
              format: { with: VALID_PASSWORD_1,
               message: "は全角(漢字、ひらがな、カタカナ)である必要があります"}
    
    VALID_PASSWORD_2 =/\A[ァ-ヶー－]+\z/
    validates :first_name_katakana, :last_name_katakana, 
              format: { with: VALID_PASSWORD_2,
               message: "は全角(カタカナ)である必要があります"}
end
