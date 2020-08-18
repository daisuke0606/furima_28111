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
- has_many :buys

## products テーブル

| Column                  | Type   | Options                       |
| ----------------------- | ------ |------------------------------ |
| image                   | string | null: false                   |
| item-name               | string | null: false                   |
| item-info               | text   | null: false                   |
| category.genre_id       | integer| null: false                   |
| status.genre_id         | integer| null: false                   |
| delivery-fee.genre_id   | integer| null: false                   |
| area.genre_id           | integer| null: false                   |
| shipping-days.genre_id  | integer| null: false                   |
| price                   | integer| null: false                   |
| user                    | string | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :buy

## buys テーブル

| Column        | Type   | Options                        |
| ------------- | ------ | ------------------------------ |
| post-code     | string | null: false                    |
| prefectures   | string | null: false                    |
| city          | string | null: false                    |
| block         | string | null: false                    |
| building      | string |                                |
| phone         | string | null: false                    |


### Association

- belongs_to :user
- belongs_to :product


##  managementテーブル

| Column        | Type   | Options                        |
| --------------| -------|--------------------------------|
| user          | string | null: false, foreign_key: true |
| item-name     | string | null: false, foreign_key: true |


### Association
- belongs_to :buys
