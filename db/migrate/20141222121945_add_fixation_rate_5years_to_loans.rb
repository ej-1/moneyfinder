class AddFixationRate5yearsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :fixation_rate_5years, :decimal
  end
end
