class AddLoantime3year8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_8k, :decimal
  end
end
