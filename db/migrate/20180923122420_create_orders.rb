class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' |t|
      t.references :user, foreign_key: true
      t.integer :shipment_status, default: 0
      t.boolean :cancel_request, default: false

      t.timestamps
    end
  end
end
