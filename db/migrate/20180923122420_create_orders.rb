class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :shipment_status, default: 0
      t.boolean :cancel_request, default: false

      t.timestamps
    end
  end
end
