class AddLoantime60d8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_8k, :decimal
  end
end
