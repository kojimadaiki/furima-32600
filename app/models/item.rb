class Item < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explain, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price, numericality: { only_integer: true, message: 'が数字ではありません' }
  end

  has_one_attached :image
  validate :image_presence
  belongs_to :user
  has_one :purchase

  def image_presence
    if image.attached?
      errors.add(:image, 'にはjpegまたはpngファイルを添付してください') unless image.content_type.in?(%('image/jpeg image/png'))
    else
      errors.add(:image, "入力してください")
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_date_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300円から9999999円までです' }
end
