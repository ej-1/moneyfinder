class AddLoantime21d6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_6k, :decimal
  end
end
