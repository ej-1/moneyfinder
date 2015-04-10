class AddLoantime60d25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_25k, :decimal
  end
end
