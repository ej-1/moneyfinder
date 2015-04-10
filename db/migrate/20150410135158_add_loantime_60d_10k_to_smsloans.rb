class AddLoantime60d10kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_10k, :decimal
  end
end
