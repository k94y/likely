class CreateNonMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :non_members, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
