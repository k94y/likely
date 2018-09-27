class TrackRelation < ApplicationRecord
  belongs_to :song
  belongs_to :disc
  belongs_to :artist

  validates :is_movie, presence: true
end
