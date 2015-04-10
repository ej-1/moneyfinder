class AddLoantime2year3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_3k, :decimal
  end
end
