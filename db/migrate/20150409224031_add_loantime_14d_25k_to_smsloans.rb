class AddLoantime14d25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_25k, :decimal
  end
end
