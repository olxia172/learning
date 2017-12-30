class AddUserToMovie < ActiveRecord::Migration[5.1]
  def change
    add_reference :movies, :user
    add_foreign_key :movies, :users, column: :user_id
  end
end
