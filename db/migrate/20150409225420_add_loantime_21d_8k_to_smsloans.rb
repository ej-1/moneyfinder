class AddLoantime21d8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_8k, :decimal
  end
end
