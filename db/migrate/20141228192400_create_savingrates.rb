class CreateSavingrates < ActiveRecord::Migration
  def change
    create_table :savingrates do |t|
      t.string :bank
      t.decimal :min_rate
      t.decimal :max_rate
      t.string :country
      t.string :currency
      t.string :conditions
      t.string :withdrawal
      t.integer :account_time_length
      t.string :deposit_guarantee
      t.string :amount_limit

      t.timestamps
    end
  end
end
