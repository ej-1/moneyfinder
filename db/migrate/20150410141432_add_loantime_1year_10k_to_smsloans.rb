class AddLoantime1year10kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_10k, :decimal
  end
end
