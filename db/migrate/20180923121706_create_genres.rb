class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.text :image_id

      t.timestamps
    end
  end
end
