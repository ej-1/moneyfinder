class AddLoantime30d25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_25k, :decimal
  end
end
