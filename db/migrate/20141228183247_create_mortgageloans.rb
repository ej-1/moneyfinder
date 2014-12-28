class CreateMortgageloans < ActiveRecord::Migration
  def change
    create_table :mortgageloans do |t|
      t.string :bank
      t.decimal :fixation_rate_3months
      t.decimal :fixation_rate_1years
      t.decimal :fixation_rate_2years
      t.decimal :fixation_rate_3years
      t.decimal :fixation_rate_5years
      t.decimal :fixation_rate_7years
      t.decimal :fixation_rate_10years
      t.string :weblink

      t.timestamps
    end
  end
end
