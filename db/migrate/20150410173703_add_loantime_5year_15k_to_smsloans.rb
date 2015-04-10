class AddLoantime5year15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_15k, :decimal
  end
end
