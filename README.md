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
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|group_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :group
- has_many :tweets _ belongs_to :member, as: :memberable


## tweets table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|text|text|
|image|text|

### Association

- belongs_to :user


## group table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|name|string|
|group_id|integer|

### Association

- has_many :users
- has_many :members, as: :memberable


## members table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|group_id|integer|

### Association

- belongs_to :group
- belongs_to :user
- belongs_to :memberable, polymorphic: true

