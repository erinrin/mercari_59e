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

# メルカリDB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_kana|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|birthday|string|null: false|
|avatar|text|null: true|
|profile|text|null: true|
### Association
- has_many :items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|description|string|null: false|
|status|integer|null: false, default: "1"|
|buyer_id|integer|null: true, foreign_key: user_id|
|seller_id|integer|null: false, foreign_key: user_id|
### Association
- belongs_to :user
- has_many :images
- belongs_to :category
- belongs_to :brand
- belongs_to :senddate
- belongs_to :sendmethod
- belongs_to :quality

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|image|text|null: false|
### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belongs_to :item
- has_ancestry

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## senddatesテーブル
|Column|Type|Options|
|------|----|-------|
|senddate|integer|null: false|
### Association
- belongs_to :item

## sendmethodsテーブル
|Column|Type|Options|
|------|----|-------|
|sendmethod|integer||null: false|
### Association
- belongs_to :item

## qualitiesテーブル
|Column|Type|Options|
|------|----|-------|
|quality|integer||null: false|
### Association
- belongs_to :item