class AddRecommendLevelToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :recommend_level, :integer, default: 0
  end
end
