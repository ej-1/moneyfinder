class AddLoantime4year3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_3k, :decimal
  end
end
