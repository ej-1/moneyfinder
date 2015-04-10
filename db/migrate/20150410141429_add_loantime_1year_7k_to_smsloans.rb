class AddLoantime1year7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_7k, :decimal
  end
end
