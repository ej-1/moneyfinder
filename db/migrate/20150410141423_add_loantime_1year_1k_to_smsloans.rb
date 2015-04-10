class AddLoantime1year1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_1k, :decimal
  end
end
