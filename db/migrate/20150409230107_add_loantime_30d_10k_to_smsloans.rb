class AddLoantime30d10kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_10k, :decimal
  end
end
