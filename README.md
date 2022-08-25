## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false,                   |
| product_description    | string     | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| freight_id             | integer    | null: false                    |
| shipping_prefecture_id | string     | null: false                    |
| ship_date              | string     | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## Addressesテーブル

| Column              | Type       | Options                 |
| ------------------- | ---------- | ----------------------- |
| post_code           | string     | null: false,            |
| prefecture_id       | integer    | null: false,            |
| municipalities      | string     | null: false,            |
| block               | string     | null: false,            |
| building_name       | string     |                         |
| phone_number        | string     | null: false,            |
| order               | references | null: false, references |

### Association

- belongs_to :order


## ordersテーブル

| prototype | references | null: false, references |
| user      | references | null: false, references |
| order     | references | null: false, references |