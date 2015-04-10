class AddLoantime4year20kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_20k, :decimal
  end
end
