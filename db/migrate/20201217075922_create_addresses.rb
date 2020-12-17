class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :telephone_number, null false
      t.integer    :prefecture_id,    null false
      t.string     :municipality,     null false
      t.string     :address_number,   null false
      t.string     :postal_code,      null false
      t.string     :apartment,        null false
      t.references :purchase,         foreign_key: true


      t.timestamps
    end
  end
end
