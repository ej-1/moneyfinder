class AddLoantime2year10kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_2year_10k, :decimal
  end
end
