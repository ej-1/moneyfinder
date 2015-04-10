class AddLoantime60d4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_4k, :decimal
  end
end
