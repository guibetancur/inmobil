class ChangeIntegerLimitInPromoter < ActiveRecord::Migration[5.0]
  def change
  	change_column :promoters, :phone, :integer, limit: 8
  end
end
