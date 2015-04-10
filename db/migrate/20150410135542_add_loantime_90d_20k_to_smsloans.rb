class AddLoantime90d20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_20k, :decimal
  end
end
