class AddLoantime3year6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_6k, :decimal
  end
end
