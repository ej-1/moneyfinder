class AddLoantime14d15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_15k, :decimal
  end
end
