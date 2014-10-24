class AddCurrencyToRates < ActiveRecord::Migration
  def change
    add_column :rates, :currency, :string
  end
end
