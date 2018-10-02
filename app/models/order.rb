class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  validates :shipment_status, presence: true, numericality: {greater_than_or_equal_to: 0}
end
