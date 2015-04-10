class AddLoantime3year20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_20k, :decimal
  end
end
