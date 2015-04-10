class AddLoantime30d9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_9k, :decimal
  end
end
