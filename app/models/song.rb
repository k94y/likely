class Song < ApplicationRecord
	mount_uploader :file, AudioFileUploader

	has_many :track_relations, inverse_of: :song

	# validates :name, presence: true, length: {in: 1..255}
	# validates :file, presense: true
end
