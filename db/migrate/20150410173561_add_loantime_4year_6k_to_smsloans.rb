class AddLoantime4year6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_6k, :decimal
  end
end
