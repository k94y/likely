class Song < ApplicationRecord
	mount_uploader :file, AudioFileUploader

	has_many :track_relations, dependent: :destroy
	belongs_to :artist, dependent: :destroy
	
	validates :name, presence: true, length: {in: 1..255}
	validates :file, presence: true
end
