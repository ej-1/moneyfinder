class AddLoantime4year30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_30k, :decimal
  end
end
