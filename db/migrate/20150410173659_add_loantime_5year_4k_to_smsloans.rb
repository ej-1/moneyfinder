class AddLoantime5year4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_4k, :decimal
  end
end
