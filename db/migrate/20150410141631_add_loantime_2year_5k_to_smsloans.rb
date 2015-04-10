class AddLoantime2year5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_5k, :decimal
  end
end
