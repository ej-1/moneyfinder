class AddLoantime5year10kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_5year_10k, :decimal
  end
end
