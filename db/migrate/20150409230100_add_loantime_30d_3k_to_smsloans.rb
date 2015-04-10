class AddLoantime30d3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_3k, :decimal
  end
end
