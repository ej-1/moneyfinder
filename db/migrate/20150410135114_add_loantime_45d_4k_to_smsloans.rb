class AddLoantime45d4kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_4k, :decimal
  end
end
