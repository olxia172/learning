class CreateGenreMoviesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :genres, :movies
  end
end
