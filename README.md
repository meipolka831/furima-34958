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


## users

| Column               | Type         | Options                     |
|----------------------|--------------|-----------------------------|
| nickname             | string       | null: false                 |
| email                | string       | null: false, unique: true   |
| encrypted_password   | string       | null: false                 |
| surname              | string       | null: false                 |
| name                 | string       | null: false                 |
| surnamekana          | string       | null: false                 |
| namekana             | string       | null: false                 |
| birthday             | date         | null: false                 |


### Association
* has_many :products
* has_many :buys

## products

| Column           | Type         | Options           |
|------------------|--------------|-------------------|
| name             | string       | null: false       |
| detail           | text         | null: false       |
| status_id        | text         | null: false       |
| burden_id        | string       | null: false       |
| area_id          | string       | null: false       |
| shipping_date_id | integer      | null: false       |
| category_id      | string       | null: false       |
| money            | integer      | null: false       |
| user             | references   | foreign_key: true |

### Association
* belongs_to :user
* has_one :buy


## buys

| Column           | Type         | Options           |
|------------------|--------------|-------------------|
| product          | references   | foreign_key: true |
| user             | references   | foreign_key: true |


### Association

* belongs_to :user
* belongs_to :product
* has_one :shipping



## shippings

| Column           | Type         | Options           |
|------------------|--------------|-------------------|
| zip              | string       | null: false       |
| area_id          | integer      | null: false       |
| city             | string       | null: false       |
| number           | string       | null: false       |
| building         | string       |
| telephone        | string       | null: false       |
| buy              | references   | foreign_key: true |


### Association

* belongs_to :buy


