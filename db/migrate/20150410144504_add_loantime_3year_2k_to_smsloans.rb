class AddLoantime3year2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_2k, :decimal
  end
end
