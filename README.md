# README

# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| last_name        | string  | null: false |
| first_name_kana  | string  | null: false |
| last_name_kana   | string  | null: false |
| last_name_kana   | integer | null: false |
| last_name_kana   | integer | null: false |
| last_name_kana   | integer | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :receivers

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| explanation       | string     | null: false                    |
| category_id       | string     | null: false                    |
| condition_id      | string     | null: false                    |
| delivery_cost_id  | string     | null: false                    |
| region_id         | string     | null: false                    |
| delivery_time_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| tax               | integer    | null: false                    |
| benifit           | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- belongs_to :receiver

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## receivers テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_no          | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| zip_code         | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| adress           | string     | null: false                    |
| building         | string     |                                |
| phone_no         | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item