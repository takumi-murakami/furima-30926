	
# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| phone_number     | integer | null: false |
| birthday         | integer | null: false |

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| text                | text       | null: false                    |
| category            | string     | null: false                    |
| sales_status        | string     | null: false                    |
| shipping_fee_status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | string     | null: false                    |
| price               | integer    | null: false                    |
| add_tax_price       | integer    | null: false                    |
| profit              | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

- belongs_to :user

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| expiration_date | integer    | null: false                    |
| expiration_date | integer    | null: false                    |
| secure_code     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city_name     | string     | null: false                    |
| block_name    | string     | null: false                    |
| building_name | string     |                                |
| user          | references | null: false, foreign_key: true |
| order         | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :order


