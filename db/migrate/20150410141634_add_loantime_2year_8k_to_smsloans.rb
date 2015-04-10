class AddLoantime2year8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_8k, :decimal
  end
end
