class Product < ApplicationRecord
  belongs_to :label
  belongs_to :genre
  has_many :cart_details
  has_many :order_details
  has_many :discs
  accepts_nested_attributes_for :discs, allow_destroy: true



  validates :name, presence: true, length: {in: 1..255}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :stock, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :type, presence: true
end
