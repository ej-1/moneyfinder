class AddLoantime3year25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_25k, :decimal
  end
end
