## user

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | nill :false, unique: true |
| encrypted_password | string  | nill: false               |
| full_lastname      | string  | nill: false               |
| full_firstname     | string  | nill: false               |
| kana_lastname      | string  | nill: false               |
| kana_firstname     | string  | nill: false               |
| birth_date         | date    | nill: false               |


### Association
has_many :items
has_many :purchases


## item

| Column            | Type    | Options     |
| ----------------- | ------  | ----------- |
| item_name         | string  | nill :false |
| item_explain      | integer | nill: false |
| item_category_id  | integer | nill: false |
| item_status_id    | string  | nill :false |
| delivery_fee_id   | integer | nill: false |
| shipping_place_id | integer | nill: false |
| shipping_date_id  | integer | nill: false |
| price             | integer | nill: false |


### Association
belongs_to :user
has_one :purchase


## purchase

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| user           | references | foreign_key: true |
| item           | references | foreign_key: true |


### Association
has_one    :address
belongs_to :item
belongs_to :user


## address

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| telephone_number    | integer | nill: false |
| prefecture_id       | integer | nill: false |
| municipality        | string  | nill: false |
| address_number      | integer | nill: false |
| postal_code         | integer | nill: false |
| apartment           | string  |             |


### Association
belongs_to :purchase
