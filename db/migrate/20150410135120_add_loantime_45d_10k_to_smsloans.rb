class AddLoantime45d10kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_10k, :decimal
  end
end
