class AddLoantime90d8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_8k, :decimal
  end
end
