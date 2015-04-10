class AddLoantime60d1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_1k, :decimal
  end
end
