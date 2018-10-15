class CreateCartDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_details, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
