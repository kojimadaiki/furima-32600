class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :name
  validates :full_lastname, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'Full-width chinese characters' }
  validates :full_firstname, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'Full-width chinese characters' }
  validates :kana_lastname, format: { with: /\p{katakana}/, message: 'Full-width katakana characters' }
  validates :kana_firstname, format: { with: /\p{katakana}/, message: 'Full-width katakana characters' }
  validates :birth_date
end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end
