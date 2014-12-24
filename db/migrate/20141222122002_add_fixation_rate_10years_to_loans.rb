class AddFixationRate10yearsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :fixation_rate_10years, :decimal
  end
end
