# README

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

### Association

- has_many: items,    dependent: :destroy
- has_many: comments, dependent: :destroy

## items テーブル

|    Column                    |   Type     |      Options                   |
| -----------------------------| -----------| ------------------------------ |
| name                         | string     | null: false                    |
| description                  | text       | null: false                    |
| price                        | integer    | null: false                    |
| product_status_id            | integer    | null: false                    |
| postage_payer_id             | integer    | null: false                    |
| prefecture_code_id           | integer    | null: false                    |
| handling_time_id             | integer    | null: false                    |
| category_id                  | integer    | null: false                    |
| user                         | references | null: false, foreign_key: true |

## Association

- has_many: comments, dependent: :destroy
- belongs_to: user
- has_one: purchase

## purchase

|    Column        |   Type     |      Options                   |
| -----------------| -----------| ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

## Association

- belongs_to: user, dependent: :destroy
- belongs_to: item, dependent: :destroy
- has_one: shopping_address, dependent: :destroy

## shopping_addresses テーブル

|    Column                    |   Type     |      Options                   |
| -----------------------------| -----------| ------------------------------ |
| post_code                    | string     | null: false                    |
| prefecture_code              | integer    | null: false                    |
| city                         | string     | null: false                    |
| address                      | string     | null: false                    |
| building_name                | string     |                                |
| phone_number                 | string     | null; false                    |
| purchase                     | references | null: false, foreign_key: true |

## Association

- belongs_to: purchase

## active_hash

- category
- product_status
- postage_payer
- prefecture_code
- handling_time

## active_storage

- item_images
