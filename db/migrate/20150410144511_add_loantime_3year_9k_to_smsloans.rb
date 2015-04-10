class AddLoantime3year9kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_9k, :decimal
  end
end
