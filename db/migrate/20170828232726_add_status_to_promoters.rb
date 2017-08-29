class AddStatusToPromoters < ActiveRecord::Migration[5.0]
  def change
    add_column :promoters, :status, :integer
  end
end
