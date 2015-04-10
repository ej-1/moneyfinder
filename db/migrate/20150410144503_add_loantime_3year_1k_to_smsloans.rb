class AddLoantime3year1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_1k, :decimal
  end
end
