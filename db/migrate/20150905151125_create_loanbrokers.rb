class CreateLoanbrokers < ActiveRecord::Migration
  def change
    create_table :loanbrokers do |t|
      t.string :broker
      t.string :broker_logo
      t.integer :min_amount
      t.integer :max_amount
      t.decimal :effective_interest
      t.integer :start_fee
      t.integer :invoice_fee
      t.string :FI_reg
      t.string :payment_note
      t.integer :minloan_time
      t.integer :maxloan_time
      t.string :min_age
      t.integer :yearly_income
      t.string :comments
      t.string :comments2
      t.string :web_link

      t.timestamps
    end
  end
end
