class AddCountryToRates < ActiveRecord::Migration
  def change
    add_column :rates, :country, :string
  end
end
