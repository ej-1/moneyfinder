class AddLoantime4year9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_9k, :decimal
  end
end
