class AddUserToOpinion < ActiveRecord::Migration[5.1]
  def change
    add_reference :opinions, :user
    add_foreign_key :opinions, :users
  end
end
