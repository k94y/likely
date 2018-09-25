class TrackRelation < ApplicationRecord
  belongs_to :song
  belongs_to :product
  belongs_to :artist

  validates :is_movie, presence: true
end
