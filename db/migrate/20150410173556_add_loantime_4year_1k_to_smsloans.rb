class AddLoantime4year1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_1k, :decimal
  end
end
