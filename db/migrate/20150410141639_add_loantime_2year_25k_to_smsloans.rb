class AddLoantime2year25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_25k, :decimal
  end
end
