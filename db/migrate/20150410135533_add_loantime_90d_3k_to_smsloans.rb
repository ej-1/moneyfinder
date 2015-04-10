class AddLoantime90d3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_3k, :decimal
  end
end
