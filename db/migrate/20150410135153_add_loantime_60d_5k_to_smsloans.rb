class AddLoantime60d5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_5k, :decimal
  end
end
