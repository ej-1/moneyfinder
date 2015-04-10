class AddLoantime21d2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_2k, :decimal
  end
end
