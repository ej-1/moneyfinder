class AddLoantime1year25kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_1year_25k, :decimal
  end
end
