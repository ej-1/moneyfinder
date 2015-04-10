class AddLoantime45d20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_20k, :decimal
  end
end
