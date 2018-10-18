class TrackRelation < ApplicationRecord
  belongs_to :disc
  belongs_to :song
  
  accepts_nested_attributes_for :song
end
