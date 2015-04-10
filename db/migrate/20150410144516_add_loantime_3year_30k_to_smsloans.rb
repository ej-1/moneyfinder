class AddLoantime3year30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_30k, :decimal
  end
end
