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

| Column        | Type   | Options                       |
| ------------- | ------ | ----------------------------- |
| image         | string | null: false                   |
| item-name     | string | null: false                   |
| item-info     | string | null: false                   |
| category      | string | null: false                   |
| status        | string | null: false                   |
| delivery-fee  | string | null: false                   |
| area          | string | null: false                   |
| shipping-days | string | null: false                   |
| price         | string | null: false                   |
| user          | string | null: false, foreign_key: true|

### Association

- belongs_to :user
  belongs_to :buy

## buys テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| card-num      | null: false | null: false                    |
| exp-month     | null: false | null: false                    |
| exp-year      | null: false | null: false                    |
| security-code | null: false | null: false                    |
| post-code     | null: false | null: false                    |
| prefectures   | null: false | null: false                    |
| city          | null: false | null: false                    |
| building      | null: false | null: false                    |
| phone         | null: false | null: false                    |
| user          | null: false | null: false, foreign_key: true |
| item-name     | null: false | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product