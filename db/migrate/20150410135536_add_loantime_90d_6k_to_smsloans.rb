class AddLoantime90d6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_6k, :decimal
  end
end
