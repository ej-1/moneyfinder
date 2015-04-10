class AddLoantime5year1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_1k, :decimal
  end
end
