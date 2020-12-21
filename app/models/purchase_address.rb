class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :telephone_number, :municipality, :postal_code, :apartment, :address_number, :prefecture_id, :token

  with_options presence: true do
    validates :municipality
    validates :address_number
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :telephone_number, format: { with:/\A\d{10,11}\z/, message: 'はハイフンを含まない11字以内です' }
    validates :postal_code, format: { with:/\A\d{3}[-]\d{4}\z/, message: 'はハイフンを含む7文字です' }

    validates :user_id
    validates :item_id

    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(telephone_number: telephone_number, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address_number: address_number, apartment: apartment, purchase_id: purchase.id)
  end
end