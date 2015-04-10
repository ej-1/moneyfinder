class AddLoantime21d10kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_10k, :decimal
  end
end
