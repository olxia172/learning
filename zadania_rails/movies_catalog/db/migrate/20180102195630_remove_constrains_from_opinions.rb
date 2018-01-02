class RemoveConstrainsFromOpinions < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:opinions, :author, true )
  end
end
