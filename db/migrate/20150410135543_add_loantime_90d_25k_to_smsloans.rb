class AddLoantime90d25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_25k, :decimal
  end
end
