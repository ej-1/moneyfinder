class AddLoantime5year3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_3k, :decimal
  end
end
