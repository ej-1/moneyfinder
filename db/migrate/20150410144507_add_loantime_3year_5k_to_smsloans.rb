class AddLoantime3year5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_5k, :decimal
  end
end
