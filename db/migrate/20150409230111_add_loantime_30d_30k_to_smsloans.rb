class AddLoantime30d30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_30k, :decimal
  end
end
