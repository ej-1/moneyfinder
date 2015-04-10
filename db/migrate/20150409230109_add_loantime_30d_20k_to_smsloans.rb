class AddLoantime30d20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_20k, :decimal
  end
end
