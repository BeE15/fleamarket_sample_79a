class Product < ApplicationRecord
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_one :purchase_history

  validates_associated :product_images

  validates :name, :description, :status, :shipping_cost, :prefecture_id, :days, :price, presence: true
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9999999 }
  validates :status, :shipping_cost, :prefecture_id, :days, exclusion: { in: %w(選択してください) }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end

