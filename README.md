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

- has_many :purchase

## items テーブル

| Column     | Type       | Options     |
| ------     | ------     | ----------- |
| name       | string     | null: false |
|user        | references | null: false |
|price       | intebger   | null: false |
|text        | string     | null: false |
|detail      | string     | null: false |
|delivery    | string     | null: false |


### Association

- belongs_to :user

## purchaseテーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |    
| item          | references | null: false, foreign_key: true |                   

### Association

- belongs_to :user
- belongs_to :item

