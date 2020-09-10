# README
# テーブル設計

## 機能の洗い出し

## 新規会員登録、ログオンをすると商品の購入、出品ができます。
## 新規会員登録及びログイン済でない方も商品の一覧や詳細を閲覧可能です。
## 決済方法は、ご自身のクレジットカードを登録して購入可能です。


## users テーブル

|    Column        |  Type  |        Options            |
| -----------------| ------ | ------------------------- |
| nickname         | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| first_name       | string | null: false               |
| family_name      | string | null: false               |
| first_name_kana  | string | null: false               |
| family_name_kana | string | null: false               |
| birthday         | date   | null: false               |
| introduction     | text   |                           |

### Association

- has_many: items,    dependent: :destroy
- has_many: comments, dependent: :destroy
- has_one:  shopping_addresses, dependent: :destroy


## shopping_addresses テーブル

|    Column                    |   Type     |      Options                   |
| -----------------------------| -----------| ------------------------------ |
| post_code                    | string     | null: false                    |
| prefecture_code              | integer    | null: false                    |
| city                         | string     | null: false                    |
| building_name                | string     |                                |
| phone_number                 | string     | unique: true                   |
| user                         | references | null: false, foreign_key: true |
| purchase                     | references | null: false, foreign_key: true |

## Association

- belongs_to: user

## comments テーブル

|    Column        |   Type     |      Options                   |
| -----------------| -----------| ------------------------------ |
| comment          | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

## Association

- belongs_to: user
- belongs_to: item

## items テーブル

|    Column                    |   Type     |      Options                   |
| -----------------------------| -----------| ------------------------------ |
| name                         | string     | null: false                    |
| description                  | text       | null: false                    |
| price                        | integer    | null: false                    |
| brand                        | text       | null: false                    |
| product_status_id            | integer    | null: false                    |
| postage_payer_id             | integer    | null: false                    |
| prefecture_code_id           | integer    | null: false                    |
| handling_time_id             | integer    | null: false                    |
| category_id                  | integer    | null: false                    |
| user                         | references | null: false, foreign_key: true |

## Association

- has_many: comments, dependent: :destroy
- belongs_to: category
- belongs_to: user

## purchase

|    Column        |   Type     |      Options                   |
| -----------------| -----------| ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

## Association

- belongs_to: user, dependent: :destroy
- has_one: item, dependent: :destroy
- has_one: shopping_address, dependent: :destroy

## active_hash

- category
- product_status
- postage_payer
- prefecture_code
- handling_time

## active_storage

- item_images
