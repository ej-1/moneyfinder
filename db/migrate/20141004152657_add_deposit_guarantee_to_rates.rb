class AddDepositGuaranteeToRates < ActiveRecord::Migration
  def change
    add_column :rates, :deposit_guarantee, :string
  end
end
