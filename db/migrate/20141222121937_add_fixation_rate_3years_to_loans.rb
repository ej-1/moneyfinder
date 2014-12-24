class AddFixationRate3yearsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :fixation_rate_3years, :decimal
  end
end
