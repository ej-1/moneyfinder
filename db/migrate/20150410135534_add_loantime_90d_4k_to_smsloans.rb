class AddLoantime90d4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_4k, :decimal
  end
end
