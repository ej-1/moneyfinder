class AddLoantime45d1kToSmsloans < ActiveRecord::Migration
  def change
    add_column :smsloans, :loantime_45d_1k, :decimal
  end
end
