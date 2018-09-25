class CreateTrackRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :track_relations do |t|
      t.references :song, foreign_key: true
      t.references :product, foreign_key: true
      t.references :artist, foreign_key: true
      t.boolean :is_movie, default: false
      t.integer :disc_number
      t.integer :track_order

      t.timestamps
    end
  end
end
