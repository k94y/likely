class TrackRelation < ApplicationRecord
  belongs_to :disc
  belongs_to :song
  belongs_to :artist

  accepts_nested_attributes_for :song
end
