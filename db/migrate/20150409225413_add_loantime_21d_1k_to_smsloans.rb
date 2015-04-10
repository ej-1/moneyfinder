class AddLoantime21d1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_1k, :decimal
  end
end
