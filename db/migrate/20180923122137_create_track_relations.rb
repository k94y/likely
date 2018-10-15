class CreateTrackRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :track_relations, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :disc, foreign_key: true
      t.references :song, foreign_key: true
      t.references :product, foreign_key: true
      t.references :artist, foreign_key: true
      t.integer :track_order
      t.timestamps
    end
  end
end
