class AddLoantime5year5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_5k, :decimal
  end
end
