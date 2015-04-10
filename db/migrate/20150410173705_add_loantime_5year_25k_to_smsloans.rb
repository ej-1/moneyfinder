class AddLoantime5year25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_25k, :decimal
  end
end
