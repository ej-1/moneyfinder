class AddLoantime60d30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_60d_30k, :decimal
  end
end
