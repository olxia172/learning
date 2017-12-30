class AddOpinionsToMovie < ActiveRecord::Migration[5.1]
  def change
    add_reference :opinions, :movie
    add_foreign_key :opinions, :movies
  end
end
