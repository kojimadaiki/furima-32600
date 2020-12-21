FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    telephone_number {1234567890}
    prefecture_id {2}
    municipality {"名古屋市"}
    address_number {1-12}
    postal_code {"123-4567"}
    user_id {1}
    item_id {1}
  end
end
