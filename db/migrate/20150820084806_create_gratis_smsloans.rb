class CreateGratisSmsloans < ActiveRecord::Migration
  def change
    create_table :gratis_smsloans do |t|
      t.string :bank
      t.integer :min_loan_amount
      t.integer :max_loan_amount
      t.integer :loan_time
      t.string :comment
      t.string :comment2
      t.string :link_button

      t.timestamps
    end
  end
end
