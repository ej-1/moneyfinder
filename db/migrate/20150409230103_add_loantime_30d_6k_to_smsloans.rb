class AddLoantime30d6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_6k, :decimal
  end
end
