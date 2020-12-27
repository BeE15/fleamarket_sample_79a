class Address < ApplicationRecord
  belongs_to :user, optional: true
  # validates :address ,presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  FULL_WIDTH_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  POST_NUMBER_REGEX = /\A\d{3}[-]\d{4}\z|\A\d{3}[-]\d{2}\z|\A\d{3}\z|\A\d{5}\z|\A\d{7}\z/
  PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :post_number, :prefecture_id, :city, :house_number, presence: true
  validates :last_name, :first_name, format: { with: FULL_WIDTH_REGEX, message: "は全角で入力して下さい" }
  validates :last_name_kana, :first_name_kana, format: { with: FULL_WIDTH_KANA_REGEX, message: "はカタカナ（全角）で入力して下さい" }
  validates :post_number, format: { with: POST_NUMBER_REGEX }
  validates :phone_number, format: { with: PHONE_NUMBER_REGEX }, allow_blank: true

end
