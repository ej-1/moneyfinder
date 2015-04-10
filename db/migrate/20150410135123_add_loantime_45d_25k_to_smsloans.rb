class AddLoantime45d25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_25k, :decimal
  end
end
