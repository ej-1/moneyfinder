class AddFixationRate7yearsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :fixation_rate_7years, :decimal
  end
end
