class CartDetail < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :number, presence: true, numericality: {greater_than: 0}
end
