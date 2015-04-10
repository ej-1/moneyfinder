class AddLoantime45d6kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_6k, :decimal
  end
end
