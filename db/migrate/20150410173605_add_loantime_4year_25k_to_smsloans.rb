class AddLoantime4year25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_4year_25k, :decimal
  end
end
