class AddLoantime2year20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_20k, :decimal
  end
end
