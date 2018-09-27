class Artist < ApplicationRecord
	has_many :track_relations

	validates :name, presence: true, length: {in: 1..255}
	validates :name_kana, presence: true, length: {in: 1..255}

	attachment :image
end
