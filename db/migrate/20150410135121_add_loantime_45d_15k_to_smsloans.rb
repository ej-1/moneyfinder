class AddLoantime45d15kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_15k, :decimal
  end
end
