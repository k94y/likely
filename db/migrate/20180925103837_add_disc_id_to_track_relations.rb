class AddDiscIdToTrackRelations < ActiveRecord::Migration[5.2]
  def change
    add_column :track_relations, :disc_id, :integer, foreign_key: true
  end
end
