class CreateCategoryOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :category_offers do |t|
      t.references :category, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
