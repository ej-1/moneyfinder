class AddWeblinkToSavingrates < ActiveRecord::Migration
  def change
    add_column :savingrates, :weblink, :string
  end
end
