class AddLoantime1year2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_2k, :decimal
  end
end
