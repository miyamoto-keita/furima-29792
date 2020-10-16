# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル


| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| birth_date      | date   | null: false |
| cust_first_name | string | null: false |
| cust_last_name  | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |


### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| name               | string     | null: false |
| user               | references | null: false,foreign_key: true |
| price              | integer    | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| area_id            | integer    | null: false |
| delivery_date_id   | integer    | null: false |


### Association

- belongs_to :user
- has_one :purchase

## purchaseテーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |    
| item          | references | null: false, foreign_key: true |                   

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

### address

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| area_id          | integer    | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Assosiation

- belongs_to :purchase





