class Product < ApplicationRecord
  has_many :discs
  has_many :track_relations, through: :discs
  has_many :songs, through: :track_relations
  accepts_nested_attributes_for :discs, allow_destroy: true
  accepts_nested_attributes_for :track_relations, allow_destroy: true
  accepts_nested_attributes_for :songs
  belongs_to :label
  belongs_to :genre
  has_many :cart_details
  has_many :order_details
  attachment :image


  validates :name, presence: true, length: {in: 1..255}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :stock, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :product_type, presence: true
end
