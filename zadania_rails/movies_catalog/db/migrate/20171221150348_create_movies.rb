class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release_date
      t.integer :length
      t.text :description
      t.string :types
      t.string :director
      t.string :writer
      t.string :country

      t.timestamps
    end
  end
end
