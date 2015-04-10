class AddLoantime21d4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_4k, :decimal
  end
end
