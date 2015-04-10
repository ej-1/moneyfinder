class AddLoantime60d15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_15k, :decimal
  end
end
