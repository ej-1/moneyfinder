class Removesmsloans < ActiveRecord::Migration
  def change
    drop_table :smsloans
  end
end
