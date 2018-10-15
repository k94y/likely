class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :label, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :name
      t.text :image_id
      t.integer :price
      t.integer :stock, default: 0
      t.integer :product_type, default: 0
      t.date :release_date

      t.timestamps
    end
  end
end
