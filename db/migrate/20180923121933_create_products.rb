class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :label, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :name
      t.text :image_id
      t.integer :price
      t.integer :stock
      t.boolean :type, default: false
      t.date :release_date

      t.timestamps
    end
  end
end
