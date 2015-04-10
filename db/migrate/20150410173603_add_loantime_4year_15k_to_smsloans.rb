class AddLoantime4year15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_15k, :decimal
  end
end
