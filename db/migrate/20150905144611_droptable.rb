class Droptable < ActiveRecord::Migration
  def change
    drop_table :loanbrokers
  end
end
