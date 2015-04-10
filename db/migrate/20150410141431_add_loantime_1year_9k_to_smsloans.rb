class AddLoantime1year9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_9k, :decimal
  end
end
