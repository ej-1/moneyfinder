class AddLoantime2year30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_30k, :decimal
  end
end
