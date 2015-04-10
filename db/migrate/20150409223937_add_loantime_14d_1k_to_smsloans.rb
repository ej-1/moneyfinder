class AddLoantime14d1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_1k, :decimal
  end
end
