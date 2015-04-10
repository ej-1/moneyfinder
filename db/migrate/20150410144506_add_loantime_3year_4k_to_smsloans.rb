class AddLoantime3year4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_3year_4k, :decimal
  end
end
