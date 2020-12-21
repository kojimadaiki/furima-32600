class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :full_lastname, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'は漢字です' }
    validates :full_firstname, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'は漢字です' }
    validates :kana_lastname, format: { with: /\p{katakana}/, message: 'は全角カタカナです' }
    validates :kana_firstname, format: { with: /\p{katakana}/, message: 'は全角カタカナです' }
    validates :birth_date
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字です'

  has_many :items
  has_many :purchases
end
