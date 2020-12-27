
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nick_name|string|null: false|
|email|string|null: false, unique: true, index:true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_name|string|null: false|
|birthday|date|null: false|
|introduction|text||
|user_image|string||
### Association
- has_one :sending_destination, dependent: :destroy
- has_one :street_address, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :payment_informations, dependent: :destroy
- has_many :purchase_histories
- has_many :credit_cards


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|status|string|null: false|
|cost|integer|null: false|
|days|integer|null: false|
|shipping_method|string|null: false|
|size_id|integer|null: false|
|category|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :buyer
- has_many :product_images, dependent: :destroy
- has_many :size

## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_last_name|string|null: false|
|destination_first_name|string|null: false|
|destination_last_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- has_one :user
- has_one :purchase_product



## street_addressテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user


## buyerテーブル
|Column|Type|Options|
|------|----|-------|
|card_information|string|null: false|
|settlement_amount|integer|null: false|
|street_adress|references|null: false, foreign_key: true|
### Association
- has_one :prpduct


## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, index: true|
|image|string|null: false|
### Association
- belongs_to :product


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :products


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products


## purchase_historyテーブル
|Column|Type|Options|
|------|----|-------|
|purchase_product|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user


