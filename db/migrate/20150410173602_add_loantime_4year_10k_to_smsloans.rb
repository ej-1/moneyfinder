class AddLoantime4year10kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_10k, :decimal
  end
end
