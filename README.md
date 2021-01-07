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
| item_id            | references | foreign_key: true |

### Association
- has_many :items
- belongs_to :management

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

### Association
- belongs_to :user
- belongs_to :management

## users_addressテーブル
| columns            | types      | options           |
| ------------------ | ---------- | ----------------- |
| postal_code        | string     | NOT NULL          | 
| prefecture_id      | integer    | NOT NULL          |
| city               | string     | NOT NULL          |
| address            | string     | NOT NULL          |
| building           | string     |                   |
| phone_number       | string     | NOT NULL          |

### Association
- belongs_to :management


## managementテーブル
| columns         | types      | options           |
| --------------- | ---------- | ----------------- |
| user_id         | references | foreign_key: true |
| item_id         | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :user_address