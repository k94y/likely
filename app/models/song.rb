class Song < ApplicationRecord
	has_many :track_relations

	validates :name, presence: true, length: {in: 1..255}
	validates :music_id, presense: true
end
