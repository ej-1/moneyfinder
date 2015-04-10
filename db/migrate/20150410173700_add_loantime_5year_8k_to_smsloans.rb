class AddLoantime5year8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_8k, :decimal
  end
end
