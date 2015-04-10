class AddLoantime5year2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_2k, :decimal
  end
end
