## usersテーブル
| columns            | types  | options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :items
- has_many :managements

## itemsテーブル
| columns                | types   | options           |
| ---------------------- | ------- | ----------------- |
| name                   | string  | null: false       |
| description            | text    | null: false       |
| category_id            | integer | null: false       |
| sales_status_id        | integer | null: false       |
| shipping_fee_status_id | integer | null: false       |
| prefecture_id          | integer | null: false       |
| scheduled_delivery_id  | integer | null: false       |
| price                  | string  | null: false       |
| user_id                | integer | foreign_key: true |

### Association
- belongs_to :user
- has_one :management

## users_addressテーブル
| columns       | types   | options           |
| ------------- | ------- | ----------------- |
| postal_code   | string  | null: false       | 
| prefecture_id | integer | null: false       |
| city          | string  | null: false       |
| address       | string  | null: false       |
| building      | string  |                   |
| phone_number  | string  | null: false       |
| management_id | integer | foreign_key: true |
### Association
- belongs_to :management


## managementテーブル
| columns | types   | options           |
| ------- | ------- | ----------------- |
| user_id | integer | foreign_key: true |
| item_id | integer | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :user_address