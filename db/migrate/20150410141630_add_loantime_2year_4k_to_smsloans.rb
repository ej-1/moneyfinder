class AddLoantime2year4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_4k, :decimal
  end
end
