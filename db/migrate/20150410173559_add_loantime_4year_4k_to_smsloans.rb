class AddLoantime4year4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_4k, :decimal
  end
end
