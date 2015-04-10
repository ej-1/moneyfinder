class AddLoantime14d6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_6k, :decimal
  end
end
