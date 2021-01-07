## usersテーブル
| columns            | types      | options           |
| ------------------ | ---------- | ----------------- |
| nickname           | string     | NOT NULL          | 
| email              | string     | NOT NULL          |
| encrypted_password | string     | NOT NULL          |
| last_name          | string     | NOT NULL          |   
| first_name         | string     | NOT NULL          |
| kana_last_name     | string     | NOT NULL          |
| kana_first_name    | string     | NOT NULL          |
| birth_day          | date       | NOT NULL          |
| user_address       | references | foreign_key: true |
### Association
- has_many :items


## itemsテーブル
| columns                | types      | options           |
| ---------------------- | ---------- | ----------------- |
| name                   | string     | NOT NULL          |
| description            | text       | NOT NULL          |
| category_id            | integer    | NOT NULL          |
| sales_status_id        | integer    | NOT NULL          |
| shipping_fee_status_id | integer    | NOT NULL          |
| prefecture_id          | integer    | NOT NULL          |
| scheduled_delivery_id  | integer    | NOT NULL          |
| price                  | string     | NOT NULL          |
| user                   | references | foreign_key: true |

### Association
- belongs_to :user

## users_addressテーブル
| columns         | types      | options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | NOT NULL          | 
| prefecture      | integer    | NOT NULL          |
| city            | string     | NOT NULL          |
| address         | string     | NOT NULL          |
| building        | string     |                   |
| phone_number    | string     | NOT NULL          |
| user_id         | references | foreign_key: true |

### Association
- 購入管理のテーブルに紐つける


## managementテーブル
| columns         | types      | options           |
| --------------- | ---------- | ----------------- |
| user_id         | references | foreign_key: true |
| item_id         | references | foreign_key: true |

