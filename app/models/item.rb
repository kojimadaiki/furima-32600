class Item < ApplicationRecord

  with_options presence: true do
    validates: name, length: { maxmum: 40 }
    validates: explain, length: { maxmum: 1000 }
    validates: category_id
    validates: status_id
    validates: delivery_fee_id
    validates: prefecture_id
    validates: shipping_date_id
    validates: price, format: { with: /\A[0-9]+\z/, message: '' }

    has_one_attached :image

end
