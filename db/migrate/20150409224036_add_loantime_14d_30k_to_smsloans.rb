class AddLoantime14d30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_14d_30k, :decimal
  end
end
