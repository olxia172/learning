class RemoveTypesColumnFromMovies < ActiveRecord::Migration[5.1]
  def change
    remove_column(:movies, :types)
  end
end
