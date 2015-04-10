class AddLoantime2year2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_2k, :decimal
  end
end
