class AddLoantime14d4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_4k, :decimal
  end
end
