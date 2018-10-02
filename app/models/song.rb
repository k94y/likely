class Song < ApplicationRecord
	#テストのためコメントアウト
	#mount_uploader :file, AudioFileUploader

	has_many :track_relations
	
	validates :name, presence: true, length: {in: 1..255}
	validates :file, presence: true
end
