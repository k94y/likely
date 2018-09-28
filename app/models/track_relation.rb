class TrackRelation < ApplicationRecord
  belongs_to :song, inverse_of: :track_relations
  belongs_to :disc
  belongs_to :artist

  accepts_nested_attributes_for :song
end
