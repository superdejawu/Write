class AddUserIdToSeeds < ActiveRecord::Migration
  def change
    add_column :seeds, :user_id, :integer
    add_index :seeds, :user_id
  end
end
