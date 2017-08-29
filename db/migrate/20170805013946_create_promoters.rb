class CreatePromoters < ActiveRecord::Migration[5.0]
  def change
    create_table :promoters do |t|
      t.references :user, foreign_key: true
      t.integer :phone
      t.string :photo
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
