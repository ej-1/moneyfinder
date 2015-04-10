class AddLoantime45d2kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_2k, :decimal
  end
end
