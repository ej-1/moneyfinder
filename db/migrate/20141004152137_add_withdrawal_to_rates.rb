class AddWithdrawalToRates < ActiveRecord::Migration
  def change
    add_column :rates, :withdrawal, :string
  end
end
