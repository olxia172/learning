class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :author, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
