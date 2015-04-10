class AddLoantime45d3kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_3k, :decimal
  end
end
