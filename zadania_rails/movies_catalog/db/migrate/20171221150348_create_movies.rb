class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.date :release_date, null: false
      t.integer :length, null: false
      t.text :description, null: false
      t.string :types, null: false
      t.string :director, null: false
      t.string :writer, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
