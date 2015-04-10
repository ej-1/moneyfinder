class AddLoantime5year30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_30k, :decimal
  end
end
