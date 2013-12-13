class AddAttachmentImageToVitamins < ActiveRecord::Migration
  def self.up
    change_table :vitamins do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :vitamins, :image
  end
end
