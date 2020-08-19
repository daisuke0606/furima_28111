# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| password        | string | null: false |
| first-name      | string | null: false |
| last-name       | string | null: false |
| first-name-kana | string | null: false |
| last-name-kana  | string | null: false |
| birth           | date   | null: false |

### Association

- has_many :products
- has_one :management

## products テーブル

| Column                  | Type      | Options                       |
| ----------------------- | --------- |------------------------------ |
| image                   | string    | null: false                   |
| item_name               | string    | null: false                   |
| item_info               | text      | null: false                   |
| category_id             | integer   | null: false                   |
| status_id               | integer   | null: false                   |
| delivery_fee_id         | integer   | null: false                   |
| prefectures_id          | integer   | null: false                   |
| shipping_days_id        | integer   | null: false                   |
| price                   | integer   | null: false                   |
| user                    |references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :management

## address テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| post-code        | string | null: false                    |
| prefectures_id   | integer| null: false                    |
| city             | string | null: false                    |
| block            | string | null: false                    |
| building         | string |                                |
| phone            | string | null: false                    |


### Association

- belongs_to :management



##  managementテーブル

| Column        | Type       | Options                        |
| --------------| ---------- |--------------------------------|
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :products