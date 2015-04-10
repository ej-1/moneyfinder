class AddLoantime30d15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_15k, :decimal
  end
end
