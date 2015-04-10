class AddLoantime1year4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_4k, :decimal
  end
end
