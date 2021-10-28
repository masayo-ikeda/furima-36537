# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_date_1i      | date                | null: false               |
| birth_date_2i      | date                | null: false               |
| birth_date_3i      | date                | null: false               |
### Association

* has_many :items
* has_many :order

## items table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | string     | null: false                    |
| image              |            | null: false                    |
| price              | integer    | null: false                    |
| seller_id          | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| rank_id            | integer    | null: false                    |
| postage_id         | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| date               | datetime   | null: false                    |

### Association

- belongs_to :users
- has_one :order

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :address
- belongs_to :order

## address table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| code        | string     | null: false                    |
| area_id     | integer    | null: false                    |
| city        | string     | null: false                    |
| number      | string     | null: false                    |
| building    | string     | null: false                    |
| tel         | string     | null: false                    |

### Association

* belongs_to :order