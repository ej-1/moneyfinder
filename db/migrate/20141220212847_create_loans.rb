class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.string :bank

      t.timestamps
    end
  end
end
