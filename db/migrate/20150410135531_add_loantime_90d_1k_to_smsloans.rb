class AddLoantime90d1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_90d_1k, :decimal
  end
end
