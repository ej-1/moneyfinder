class AddFixationRate1yearToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :fixation_rate_1year, :decimal
  end
end
