class AddLoantime30d4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_4k, :decimal
  end
end
