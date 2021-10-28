# DB 設計

## users table
item 
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_date_1i      | datetime            | null: false               |
| birth_date_2i      | datetime            | null: false               |
| birth_date_3i      | datetime            | null: false               |
### Association

* has_many :items
* has_many :orders
* has_one :address

## items table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| user_id            | references | null: false, foreign_key: true |
| item               | string     | null: false                    |
| image              | string     | null: false                    |
| price              | integer    | null: false                    |
| seller             | string     | null: false                    |
| category           | string     | null: false                    |
| rank               | string     | null: false                    |
| postage            | string     | null: false                    |
| area               | string     | null: false                    |
| date               | datetime   | null: false                    |

### Association

- belongs_to :users

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :address

## address table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| code        | string     | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| number      | string     | null: false                    |
| building    | string     | null: false                    |
| tel         | string     | null: false                    |

### Association

- belongs_to :users
* belongs_to :orders