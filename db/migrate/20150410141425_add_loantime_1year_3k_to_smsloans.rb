class AddLoantime1year3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_3k, :decimal
  end
end
