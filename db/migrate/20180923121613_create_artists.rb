class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.string :name_kana
      t.text :image_id

      t.timestamps
    end
  end
end
