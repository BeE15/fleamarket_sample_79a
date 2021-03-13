class Category < ApplicationRecord
  has_many :product
  has_ancestry
end