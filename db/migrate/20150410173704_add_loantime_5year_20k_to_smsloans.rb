class AddLoantime5year20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_20k, :decimal
  end
end
