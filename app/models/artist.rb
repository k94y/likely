class Artist < ApplicationRecord
	has_many :songs

	validates :name, presence: true, length: {in: 1..255}
	validates :name_kana, presence: true, length: {in: 1..255}

	attachment :image
end
