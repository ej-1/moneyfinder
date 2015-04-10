class AddLoantime14d3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_3k, :decimal
  end
end
