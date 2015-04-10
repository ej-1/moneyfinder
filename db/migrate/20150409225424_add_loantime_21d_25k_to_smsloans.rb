class AddLoantime21d25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_25k, :decimal
  end
end
