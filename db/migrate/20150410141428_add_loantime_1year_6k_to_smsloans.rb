class AddLoantime1year6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_6k, :decimal
  end
end
