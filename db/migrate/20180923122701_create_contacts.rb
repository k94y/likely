class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :user_id
      t.string :non_member_id
      t.string :title
      t.text :body
      t.boolean :reply_status, default: false

      t.timestamps
    end
  end
end
