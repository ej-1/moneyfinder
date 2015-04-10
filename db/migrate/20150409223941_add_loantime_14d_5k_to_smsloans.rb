class AddLoantime14d5kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_5k, :decimal
  end
end
