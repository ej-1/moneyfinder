class AddLoantime60d6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_6k, :decimal
  end
end
