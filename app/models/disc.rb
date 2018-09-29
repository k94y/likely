class Disc < ApplicationRecord
    belongs_to :product
    has_many :track_relations
    accepts_nested_attributes_for :track_relations, allow_destroy: true
end
