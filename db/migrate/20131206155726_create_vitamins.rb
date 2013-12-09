class CreateVitamins < ActiveRecord::Migration
  def change
    create_table :vitamins do |t|
      t.string :description

      t.timestamps
    end
  end
end
