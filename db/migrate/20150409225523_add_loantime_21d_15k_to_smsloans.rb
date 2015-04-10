class AddLoantime21d15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_15k, :decimal
  end
end
