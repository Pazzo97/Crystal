class Record < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { only_integer: true }
end
