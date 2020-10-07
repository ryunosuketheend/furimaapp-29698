# table設計

  users table

| Column              | Type   | Options                 |
| ------------------- | ------ | ----------------------- |
| nickname            | string | null:false  unique:true |
| first_name          | string | null:false              |
| last_name           | string | null:false              |
| first_name_katakana | string | null:false              |
| last_name_katakana  | string | null:false              |
| birthday            | date   | null:false              |
| email               | string | null:false  unique:true |
| password            | string | null:false              |

  Association

- has_many :items
- has_many :orders


  items table

| Column              | Type       | Options                      |
| ------------------- | ---------- | ---------------------------- |
| name                | string     | null:false                   |
| detail              | text       | null:false                   |
| category            | integer    | null:false                   |
| quality             | integer    | null:false                   |
| delivery_cost       | integer    | null:false                   |
| delivery_day        | integer    | null:false                   |
| price               | integer    | null:false                   |
| user_id             | integer    | null:false  foreign_key:true |
| region_id           | integer    | null:false                   |

  Association

- belongs_to :user
- has_one    :order


  addresses table

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| order         | references | null:false  foreign_key:true |
| postal_code   | string     | null:false                   |
| region_id     | integer    | null:false                   |
| city          | string     | null:false                   |
| building_name | string     |                              |
| phone_number  | string     | null:false                   |
| house_number  | string     | null:false                   |

  Association

- belongs_to :order


 orders table

 | Column  | Type       | Options                      |
 | ------- | ---------- | ---------------------------- |
 | user    | references | null:false  foreign_key:true |
 | item    | references | null:false  foreign_key:true |

  Association

- belongs_to :user
- belongs_to :item
- has_one    :address
