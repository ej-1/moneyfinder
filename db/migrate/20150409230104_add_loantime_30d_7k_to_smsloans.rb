class AddLoantime30d7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_7k, :decimal
  end
end
