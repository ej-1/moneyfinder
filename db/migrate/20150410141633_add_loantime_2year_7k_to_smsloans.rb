class AddLoantime2year7kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_7k, :decimal
  end
end
