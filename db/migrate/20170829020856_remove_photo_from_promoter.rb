class RemovePhotoFromPromoter < ActiveRecord::Migration[5.0]
  def change
    remove_column :promoters, :photo, :string
  end
end
