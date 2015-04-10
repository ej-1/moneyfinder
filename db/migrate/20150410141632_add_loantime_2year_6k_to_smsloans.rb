class AddLoantime2year6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_6k, :decimal
  end
end
