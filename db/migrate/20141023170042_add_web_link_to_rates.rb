class AddWebLinkToRates < ActiveRecord::Migration
  def change
    add_column :rates, :web_link, :string
  end
end
