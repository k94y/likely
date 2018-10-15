class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' |t|
      t.references :product, foreign_key: true
      t.boolean :is_movie, default: false
      t.integer :disc_order
      t.timestamps
    end
  end
end
