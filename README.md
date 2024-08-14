#テーブルの設計

##usersテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| encrypted_password | string     | null: false |
| email              | string     | null: false, unique: true |
| family_name        | string     | null: false |
| first_name         | string     | null: false |
| kana_family_name   | string     | null: false |
| kana_first_name    | string     | null: false |
| year_id            | string     | null: false |
| month_id           | string     | null: false |
| day_id             | string     | null: false |

has_many :items
has_many :orders

##itemsテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| text               | text       | null: false |
| category_id        | string     | null: false |
| condition_id       | string     | null: false |
| delivery_charge_id | string     | null: false |
| area_id            | string     | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

belongs_to :user
has_one :order

##ordersテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :addresse

##addressesテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| japan_area_id      | integer    | null: false |
| city               | string     | null: false |
| house_number       | string     | null: false |
| building_name      | string     |
| order              | references | null: false, foreign_key: true |

belongs_to :order