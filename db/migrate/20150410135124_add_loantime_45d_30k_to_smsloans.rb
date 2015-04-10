class AddLoantime45d30kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_30k, :decimal
  end
end
