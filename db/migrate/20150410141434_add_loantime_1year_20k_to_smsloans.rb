class AddLoantime1year20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_20k, :decimal
  end
end
