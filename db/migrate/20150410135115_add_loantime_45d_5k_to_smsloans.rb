class AddLoantime45d5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_5k, :decimal
  end
end
