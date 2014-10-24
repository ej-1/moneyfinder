class AddAccountTimeLengthToRates < ActiveRecord::Migration
  def change
    add_column :rates, :account_time_length, :integer
  end
end
