class AddLoantime14d10kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_10k, :decimal
  end
end
