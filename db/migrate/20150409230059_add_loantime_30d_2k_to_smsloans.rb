class AddLoantime30d2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_2k, :decimal
  end
end
