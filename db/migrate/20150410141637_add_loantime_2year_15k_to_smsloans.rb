class AddLoantime2year15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_15k, :decimal
  end
end
