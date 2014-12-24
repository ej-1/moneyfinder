class AddWebLinkToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :web_link, :string
  end
end
