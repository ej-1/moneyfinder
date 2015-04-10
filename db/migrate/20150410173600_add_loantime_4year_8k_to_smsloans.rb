class AddLoantime4year8kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_8k, :decimal
  end
end
