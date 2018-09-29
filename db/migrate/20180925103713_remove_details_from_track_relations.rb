class RemoveDetailsFromTrackRelations < ActiveRecord::Migration[5.2]
  def change
    remove_column :track_relations, :product_id, :integer
    remove_column :track_relations, :is_movie, :boolean
    remove_column :track_relations, :disc_number, :integer
  end
end
