class AddLoantime14d2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_2k, :decimal
  end
end
