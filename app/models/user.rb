class User < ApplicationRecord
  has_many :categories
  has_many :records

  validates :name, presence: true, length: { maximum: 250 }
end