# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| password        | string | null: false |
| email           | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth           | date   | null: false |

### Association

- has_many :items
- has_many :managements

## items テーブル

| Column                  | Type      | Options                       |
| ----------------------- | --------- |------------------------------ |
| name                    | string    | null: false                   |
| info                    | text      | null: false                   |
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
- has_one_attached :image

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
| item          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address