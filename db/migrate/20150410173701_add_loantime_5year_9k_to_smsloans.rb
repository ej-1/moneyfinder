class AddLoantime5year9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_9k, :decimal
  end
end
