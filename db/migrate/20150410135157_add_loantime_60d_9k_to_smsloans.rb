class AddLoantime60d9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_9k, :decimal
  end
end
