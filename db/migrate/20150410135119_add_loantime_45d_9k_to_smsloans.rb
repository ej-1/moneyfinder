class AddLoantime45d9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_9k, :decimal
  end
end
