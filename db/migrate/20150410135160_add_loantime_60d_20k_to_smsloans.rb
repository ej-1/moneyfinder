class AddLoantime60d20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_20k, :decimal
  end
end
