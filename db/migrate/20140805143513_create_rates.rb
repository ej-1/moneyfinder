class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :bank
      t.decimal :min_rate
      t.decimal :max_rate

      t.timestamps
    end
  end
end
