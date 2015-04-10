class AddLoantime2year9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_9k, :decimal
  end
end
