#テーブルの設計

##usersテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| encrypted_password | string     | null: false |
| email              | string     | null: false |

has_many :items
has_one :buy

##itemsテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| image              | binary     | null: false |
| title              | string     | null: false |
| text               | text       | null: false |
| price              | float      | null: false |
| user_id            | references | null: false |

belongs_to :user
has_one :buy

##buysテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| card_number        | float      | null: false |
| effective_date     | date       | null: false |
| security_code      | float      | null: false |
| postal code        | string     | null: false |
| city               | string     | null: false |
| house_number       | string     | null: false |
| building_name      | string     | null: false |
| user_id            | references | null: false |
| items_id           | references | null: false |

belongs_to :user
belongs_to :items