class AddReviewToMovie < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :movie
    add_foreign_key :reviews, :movies
  end
end
