class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.text :file
      t.integer :recommend_level

      t.timestamps
    end
  end
end
