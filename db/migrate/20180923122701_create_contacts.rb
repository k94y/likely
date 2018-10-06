class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :user
      t.references :non_member
      t.string :title
      t.text :body
      t.boolean :reply_status, default: false

      t.timestamps
    end
  end
end
