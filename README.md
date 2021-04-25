# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | unique: true, null: false |
| email              | string  | unique: true, null: false |
| password           | string  | null: false               |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| explanation       | string     | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| delivery_cost_id  | integer    | null: false                    |
| region_id         | integer    | null: false                    |
| delivery_time_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| purchase          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- belongs_to :purchase

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item

## deliveries テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| zip_code         | integer    | null: false                     |
| prefecture_id    | integer    | null: false                     |
| city             | string     | null: false                     |
| adress           | string     | null: false                     |
| building         | string     |                                 |
| phone_no         | integer    | null: false                     |
| purchase         | references | null: false, foreign_key: true  |

### Association
- belongs_to :purchase

## purchases テーブル


| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| delivery         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :delivery