class AddLoantime30d8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_8k, :decimal
  end
end
