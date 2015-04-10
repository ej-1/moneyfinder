class AddLoantime14d9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_9k, :decimal
  end
end
