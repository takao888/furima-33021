## usersテーブル
| columns         | types      | options           |
| --------------- | ---------- | ----------------- |
| nickname        | string     | NOT NULL          | 
| email           | string     | NOT NULL          |
| password        | string     | NOT NULL          |
| last_name       | string     | NOT NULL          |   
| first_name      | string     | NOT NULL          |
| kana_last_name  | string     | NOT NULL          |
| kana_first_name | string     | NOT NULL          |
| birth_year      | date       | NOT NULL          |
| birth_month     | date       | NOT NULL          |
| birth_day       | date       | NOT NULL          |
| user_address    | references | foreign_key: true |
### Association
- has_many :items
- has_one :users_address


## itemsテーブル
| columns                | types     | options  |
| ---------------------- | --------- | -------- |
| image                  | string    | NOT NULL |
| name                   | string    | NOT NULL |
| description            | text      | NOT NULL |
| category_id            | integer   | NOT NULL |
| sales_status_id        | integer   | NOT NULL |
| shipping_fee_status_id | integer   | NOT NULL |
| prefecture_id          | integer   | NOT NULL |
| scheduled_delivery_id  | integer   | NOT NULL |
| price                  | string    | NOT NULL |

### Association
- belongs_to :user
- belongs_to :user_address

## users_addressテーブル
| columns         | types      | options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | NOT NULL          | 
| prefecture      | string     | NOT NULL          |
| city            | string     | NOT NULL          |
| address         | string     | NOT NULL          |
| building        | string     | NOT NULL          |
| phone_number    | string     | NOT NULL          |
| last_name       | string     | NOT NULL          |
| first_name      | string     | NOT NULL          |
| kana_last_name  | string     | NOT NULL          | 
| kana_first_name | string     | NOT NULL          |
| user            | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item