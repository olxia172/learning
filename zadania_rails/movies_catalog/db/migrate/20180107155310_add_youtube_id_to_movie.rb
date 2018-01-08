class AddYoutubeIdToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :youtube_id, :string
  end
end
