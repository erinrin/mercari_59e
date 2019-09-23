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
|kanjiname|string|null: false|
|kananame|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|birthday|string|null: false|
|image|text|null: true|
|profile|text|null: true|
### Association
- has_many :items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|price|string|null: false|
|description|string|null: false|
|buyer_id|integer|null: true, foreign_key: user_id|
|seller_id|integer|null: false, foreign_key: user_id|
### Association
- belongs_to :user
- has_many :image
- belongs_to :large_category
- belongs_to :medium_category
- belongs_to :small_category
- belongs_to :brand
- belongs_to :state
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

## large_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belongs_to :item

## medium_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|large_category|references|false, foreign_key: true|
### Association
- belongs_to :item

## small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|medium_category|references|false, foreign_key: true|
### Association
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|
### Association
- belongs_to :item

## statusテーブル
|Column|Type|Options|
|------|----|-------|
|state|integer|null: false, default: "1"|
### Association
- belongs_to :item

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