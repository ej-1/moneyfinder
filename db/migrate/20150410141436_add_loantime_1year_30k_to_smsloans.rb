class AddLoantime1year30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_30k, :decimal
  end
end
