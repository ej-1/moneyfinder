class AddLoantime4year5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_5k, :decimal
  end
end
