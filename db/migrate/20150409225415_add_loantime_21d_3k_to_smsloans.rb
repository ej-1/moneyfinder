class AddLoantime21d3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_3k, :decimal
  end
end
