class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.string :author, null: false
      t.integer :rate, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
