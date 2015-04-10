class AddLoantime21d20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_20k, :decimal
  end
end
