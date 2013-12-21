class AddWritingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :writing, :text
  end
end
