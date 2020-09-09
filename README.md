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

### Association

- has_many: items,    dependent: :destroy
- has_many: comments, dependent: :destroy
- has_one:  profiles, dependent: :destroy
- has_one:  credit_card, dependent: :destroy
- has_one:  shopping_addresses, dependent: :destroy

## profiles　テーブル

|    Column        |   Type     |      Options                   |
| -----------------| -----------| ------------------------------ |
| first_name       | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| birthday         | date       | null: false                    |
| introduction     | text       |                                |
| user_id          | references | null: false, foreign_key: true |

## Association

- belongs_to: user


## shopping_addresses テーブル

|    Column                    |   Type     |      Options                   |
| -----------------------------| -----------| ------------------------------ |
| destination_first_name       | string     | null: false                    |
| destination_family_name      | string     | null: false                    |
| destination_first_name_kana  | string     | null: false                    |
| destination_family_name_kana | string     | null: false                    |
| post_code                    | integer(7) | null: false                    |
| prefecture_code              | integer    | null: false                    |
| city                         | string     | null: false                    |
| house_number                 | string     | null: false                    |
| building_name                | string     |                                |
| phone_number                 | integer    | unique: true                   |
| user_id                      | references | null: false, foreign_key: true |

## Association

- belongs_to: user

## credit_card テーブル

|    Column        |   Type     |      Options                   |
| -----------------| -----------| ------------------------------ |
| user_id          | integer    | null: false                    |
| customer_id      | string     | null: false                    |
| card_id          | string     | null: false                    |

## Association

- belongs_to: user

## comments テーブル

|    Column        |   Type     |      Options                   |
| -----------------| -----------| ------------------------------ |
| comment          | text       | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

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
| product_status               | integer    | null: false, foreign_key: true |
| postage_payer                | integer    | null: false, foreign_key: true |
| prefecture_code              | string     | null: false                    |
| preparation_day              | string     | null: false, foreign_key: true |
| category_id                  | references | null: false, foreign_key: true |
| seller                       | references | null: false, foreign_key: true |
| buyer                        | references | foreign_key: true              |

## Association

- has_many: comments, dependent: :destroy
- has_many: item_images, dependent: :destroy
- belongs_to: category
- belongs_to: user

## item_images テーブル

|    Column        |   Type     |      Options                   |
| -----------------| -----------| ------------------------------ |
| image            | text       | null: false                    |
| item_id          | references | null: false, foreign_key: true |

## Association

- belongs_to: item

## categories テーブル

|    Column        |   Type     |      Options                   |
| -----------------| -----------| ------------------------------ |
| name             | string     | null: false                    |
| type             | string     | null: false                    |

## Association

- has_many: items
