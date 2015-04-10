class AddLoantime21d30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_21d_30k, :decimal
  end
end
