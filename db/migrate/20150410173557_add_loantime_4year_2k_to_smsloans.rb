class AddLoantime4year2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_2k, :decimal
  end
end
