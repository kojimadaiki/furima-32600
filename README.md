## user

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| full_lastname      | string  | null: false               |
| full_firstname     | string  | null: false               |
| kana_lastname      | string  | null: false               |
| kana_firstname     | string  | null: false               |
| birth_date         | date    | null: false               |


### Association
has_many :items
has_many :purchases


## item

| Column            | Type       | Options           |
| ----------------- | ---------  | ----------------- |
| name              | string     | null: false       |
| explain           | text       | null: false       |
| category_id       | integer    | null: false       |
| status_id         | integer    | null: false       |
| delivery_fee_id   | integer    | null: false       |
| prefecture_id     | integer    | null: false       |
| shipping_date_id  | integer    | null: false       |
| price             | integer    | null: false       |
| user              | references | foreign_key: true |


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

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| telephone_number    | string     | null: false       |
| prefecture_id       | integer    | null: false       |
| municipality        | string     | null: false       |
| address_number      | integer    | null: false       |
| postal_code         | string     | null: false       |
| apartment           | string     |                   |
| purchase            | references | foreign_key: true |


### Association
belongs_to :purchase
