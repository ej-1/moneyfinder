class AddLoantime21d5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_5k, :decimal
  end
end
