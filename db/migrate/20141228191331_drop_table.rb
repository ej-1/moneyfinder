class DropTable < ActiveRecord::Migration
  def self.up
    drop_table :smsloans
  end
end
