class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.string :prompt

      t.timestamps
    end
  end
end
