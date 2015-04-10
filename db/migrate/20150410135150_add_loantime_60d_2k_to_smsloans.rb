class AddLoantime60d2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_2k, :decimal
  end
end
