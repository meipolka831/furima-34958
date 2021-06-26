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

| Column     | Type         | Options        |
|------------|--------------|----------------|
| nickname   | string       | null: false    |
| email      | string       | null: false    |
| password   | string       | null: false    |
| name       | string       | null: false    |
| namekana   | string       | null: false    |
| birthday   | string       | null: false    |


### Association
* has_many :products
* has_many :buy

## products

| Column           | Type         | Options           |
|------------------|--------------|-------------------|
| name             | string       | null: false       |
| image            | string       | null: false       |
| detail           | text         | null: false       |
| discription      | text         | null: false       |
| user             | reference    | foreign_key: true |

### Association
* belongs_to :users
* has_one :sends
* has_one :buy


## buys

| Column           | Type         | Options           |
|------------------|--------------|-------------------|
| ccnumber         | string       | null: false       |
| ccdate           | string       | null: false       |
| cccode           | string       | null: false       |
| product          | reference    | foreign_key: true |
| user             | reference    | foreign_key: true |


### Association

* belongs_to :users
* belongs_to :products
* has_one :sends


## sends

## sends

| Column           | Type         | Options           |
|------------------|--------------|-------------------|
| zip              | string       | null: false       |
| prefecture       | string       | null: false       |
| city             | string       | null: false       |
| number           | string       | null: false       |
| built            | string       | null: false       |
| telephone        | string       | null: false       |
| product          | reference    | foreign_key: true |
| user             | reference    | foreign_key: true |
| buy              | reference    | foreign_key: true |


### Association

* belongs_to :users
* belongs_to :products
* belongs_to :buy


