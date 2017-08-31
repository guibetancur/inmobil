class AddCityIdToPromoters < ActiveRecord::Migration[5.0]
  def change
    add_reference :promoters, :city, foreign_key: true
  end
end
