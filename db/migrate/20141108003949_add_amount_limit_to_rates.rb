class AddAmountLimitToRates < ActiveRecord::Migration
  def change
    add_column :rates, :amount_limit, :string
  end
end
