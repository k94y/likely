class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :price
      t.integer :number

      t.timestamps
    end
  end
end
