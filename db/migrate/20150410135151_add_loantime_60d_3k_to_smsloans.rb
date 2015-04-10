class AddLoantime60d3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_3k, :decimal
  end
end
