class AddFixationRateToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :fixation_rate_3months, :decimal
  end
end
