class AddLoantime2year1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_1k, :decimal
  end
end
