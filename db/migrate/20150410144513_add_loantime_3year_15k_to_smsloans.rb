class AddLoantime3year15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_15k, :decimal
  end
end
