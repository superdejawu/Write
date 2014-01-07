class AddSeedIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :seed_id, :integer
    add_index :posts, :seed_id
  end
end
