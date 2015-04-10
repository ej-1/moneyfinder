class AddLoantime1year5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_5k, :decimal
  end
end
