class AddLoantime3year7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_7k, :decimal
  end
end
