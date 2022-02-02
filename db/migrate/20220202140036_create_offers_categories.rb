class CreateOffersCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :offers_categories do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
