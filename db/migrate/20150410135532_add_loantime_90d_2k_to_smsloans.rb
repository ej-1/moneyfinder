class AddLoantime90d2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_2k, :decimal
  end
end
