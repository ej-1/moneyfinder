class AddLoantime5year7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_7k, :decimal
  end
end
