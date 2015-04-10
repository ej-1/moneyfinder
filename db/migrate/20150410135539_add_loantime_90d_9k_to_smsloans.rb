class AddLoantime90d9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_9k, :decimal
  end
end
