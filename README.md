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

DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|email|string|null: false|

### Association

- has_many :groups, through: :members
- has_many :messages


## messages table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|text|string|
|image|string|
|group_id|integer|null: false,  foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## groups table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

- has_many :users, through: :members
- has_many :messages


## members table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, add_index: true|
|group_id|integer|null: false|

### Association

- belongs_to :group
- belongs_to :user

