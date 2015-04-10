class AddLoantime90d5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_5k, :decimal
  end
end
