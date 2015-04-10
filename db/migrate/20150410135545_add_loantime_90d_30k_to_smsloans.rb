class AddLoantime90d30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_30k, :decimal
  end
end
