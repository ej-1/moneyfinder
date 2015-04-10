class AddLoantime14d7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_7k, :decimal
  end
end
