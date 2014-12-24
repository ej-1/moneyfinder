class AddFixationRate2yearsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :fixation_rate_2years, :decimal
  end
end
