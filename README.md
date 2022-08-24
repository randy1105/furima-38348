## usersテーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
| password          | string | null: false               |
| first_name        | string | null: false               |
| last_name         | string | null: false               |
| first_name_kana   | string | null: false               |
| last_name_kana    | string | null: false               |

### Association

- has_many :items
- has_many :purchase_informations


## itemテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false,                   |
| product_description | string     | null: false                    |
| status              | string     | null: false                    |
| freight             | string     | null: false                    |
| shipping_prefecture | string     | null: false                    |
| ship_date           | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_information


## purchase_informationテーブル

| Column           | Type       | Options                 |
| ---------------- | ---------- | ----------------------- |
| card_number      | integer    | null: false,            |
| card_expirymouth | date       | null: false,            |
| card_expiryyear  | date       | null: false,            |
| post_code        | text       | null: false,            |
| prefecture       | string     | null: false,            |
| municipalities   | string     | null: false,            |
| address          | string     | null: false,            |
| building_name    | string     | null: false,            |
| phone_number     | string     | null: false,            |
| user             | references | null: false, references |
| item             | references | null: false, references |

### Association

- belongs_to :user
- belongs_to :purchase_information
