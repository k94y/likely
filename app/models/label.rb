class Label < ApplicationRecord
	has_many :products
	validates :name, presence: true, length: {in: 1..255}
end
