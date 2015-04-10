class AddLoantime90d7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_7k, :decimal
  end
end
