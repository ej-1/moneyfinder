class Removewarriors < ActiveRecord::Migration
  def change
    drop_table :warriors
  end
end
