class AddLoantime21d9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_9k, :decimal
  end
end
