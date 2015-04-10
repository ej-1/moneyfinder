class AddLoantime1year8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_8k, :decimal
  end
end
