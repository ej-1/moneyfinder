class AddLoantime4year7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_7k, :decimal
  end
end
