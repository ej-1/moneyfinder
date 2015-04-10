class AddLoantime14d8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_8k, :decimal
  end
end
