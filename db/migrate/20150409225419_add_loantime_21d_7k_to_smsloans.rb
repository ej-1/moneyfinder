class AddLoantime21d7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_7k, :decimal
  end
end
