class AddLoantime14d20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_20k, :decimal
  end
end
