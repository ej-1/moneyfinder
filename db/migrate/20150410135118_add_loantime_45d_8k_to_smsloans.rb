class AddLoantime45d8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_8k, :decimal
  end
end
