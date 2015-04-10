class AddLoantime1year15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_15k, :decimal
  end
end
