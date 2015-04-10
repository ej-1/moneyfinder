class AddLoantime3year3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_3k, :decimal
  end
end
