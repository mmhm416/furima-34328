# README

# テーブル設計

## users テーブル

| Column          | Type    | Options      |
| --------------- | ------- | ------------ |
| nickname        | string  | unique: true |
| email           | string  | unique: true |
| password        | string  | null: false  |
| first_name      | string  | null: false  |
| last_name       | string  | null: false  |
| first_name_kana | string  | null: false  |
| last_name_kana  | string  | null: false  |
| birth_year      | integer | null: false  |
| birth_month     | integer | null: false  |
| birth_day       | integer | null: false  |


### Association

- has_many :items
- has_many :receivers
- has_many :comments

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | string     | null: false                    |
| condition_id     | string     | null: false                    |
| delivery_cost_id | string     | null: false                    |
| region_id        | string     | null: false                    |
| delivery_time_id | string     | null: false                    |
| price            | integer    | null: false                    |
| tax              | integer    | null: false                    |
| benifit          | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- belongs_to :reciver

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

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| card_no           | integer    | null: false                    |
| explanation_month | integer    | null: false                    |
| explanation_year  | integer    | null: false                    |
| security_code     | integer    | null: false                    |
| zip_code          | integer    | null: false                    |
| prefecture_id     | string     | null: false                    |
| city              | string     | null: false                    |
| adress            | string     | null: false                    |
| buildig           | string     |                                |
| phone_no          | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
