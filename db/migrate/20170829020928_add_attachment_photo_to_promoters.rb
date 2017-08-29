class AddAttachmentPhotoToPromoters < ActiveRecord::Migration
  def self.up
    change_table :promoters do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :promoters, :photo
  end
end
