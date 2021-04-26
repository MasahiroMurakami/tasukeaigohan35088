# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |
| address            | text   | null: false               |
| phone_number       | string | null: false               |


### Association

- has_many :buyer_histories
- has_many :items dependent: :destroy

## orders テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| name             | string        | null: false                    |
| address          | text          | null: false                    |
| phone_number     | string        | null: false                    |
| buyer_history_id | integer       | null: false, foreign_key: true |

### Association

- belongs_to :buyer_history

## buyer_histories テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order

## items テーブル

| Column                  | Type          | Options                        |
| ----------------------- | ------------- | ------------------------------ |
| store_name              | string        | null: false                    |
| store_address           | text          | null: false                    |
| name                    | string        | null: false                    |
| info                    | text          | null: false                    |
| category_id             | integer       | null: false                    |
| allergies               | text          | null: false                    |
| price                   | integer       | null: false                    |
| remarks                 | text          | null: false                    |
| user_id                 | integer       | null: false, foreign_key: true |

### Association
- has_one :buyer_history
- belongs_to :user
