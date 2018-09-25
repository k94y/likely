class Product < ApplicationRecord
  belongs_to :label
  belongs_to :genre
  has_many :cart_details
  has_many :order_details
  has_many :track_relations


  validates :name, presence: true, length: {in: 1..255}
  validetes :price, presence: true, numerucality: {greater_than: 0}
  validates :stock, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :type, presence: true
end
