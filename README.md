# README
# テーブル設計

## users テーブル

| Column           |  Type  |   Options                 |
| -----------------| ------ | ------------------------- |
| nickname         | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false, unique: true |
| first_name       | string | null: false               |
| family_name      | string | null: false               |
| first_name_kana  | string | null: false               |
| family_name_kana | string | null: false               |
| birthday         |  date  | null: false               |

### Association

- has