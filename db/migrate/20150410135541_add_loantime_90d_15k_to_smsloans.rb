class AddLoantime90d15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_15k, :decimal
  end
end
