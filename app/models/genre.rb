class Genre < ApplicationRecord
	has_many :products
	validates :name, presence: true, length: {in: 1..255}

	attachment :image
end
