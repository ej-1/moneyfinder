class AddLoantime30d1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_30d_1k, :decimal
  end
end
