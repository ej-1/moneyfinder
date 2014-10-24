class AddConditionsToRates < ActiveRecord::Migration
  def change
    add_column :rates, :conditions, :string
  end
end
