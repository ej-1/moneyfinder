class AddLoantime60d7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_7k, :decimal
  end
end
