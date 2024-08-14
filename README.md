#テーブルの設計

##usersテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| encrypted_password | string     | null: false |
| email              | string     | unique: true |
| family_name        | string     | null: false |
| first_name         | string     | null: false |
| kana_family_name   | string     | null: false |
| kana_first_name    | string     | null: false |

has_many :item
has_one :order

##itemsテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| text               | text       | null: false |
| price              | integer    | null: false |
| genre_id           | integer    | null: false |
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
has_one :addresses

##addressesテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| city               | string     | null: false |
| house_number       | string     | null: false |
| building_name      | string     |
| order              | references | null: false, foreign_key: true |

belongs_to :order