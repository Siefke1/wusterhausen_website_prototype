class AddTownToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :town, :string
  end
end
