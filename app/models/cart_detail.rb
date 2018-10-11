class CartDetail < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :number, presence: true, numericality: {greater_than_or_equal_to: 0}
end
