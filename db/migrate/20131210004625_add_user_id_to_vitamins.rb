class AddUserIdToVitamins < ActiveRecord::Migration
  def change
    add_column :vitamins, :user_id, :integer
    add_index :vitamins, :user_id
  end
end
