class AddLoantime5year6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_6k, :decimal
  end
end
