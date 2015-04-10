class AddLoantime30d5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_5k, :decimal
  end
end
