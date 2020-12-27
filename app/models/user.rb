class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  
  has_many :products, dependent: :destroy
  validates :name, presence: true, uniqueness: true

end
