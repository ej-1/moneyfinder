class AddLoantime45d7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_7k, :decimal
  end
end
