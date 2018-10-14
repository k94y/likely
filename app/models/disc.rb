class Disc < ApplicationRecord
    belongs_to :product
    has_many :track_relations, dependent: :destroy
    accepts_nested_attributes_for :track_relations, allow_destroy: true
end
