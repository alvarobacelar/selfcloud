class AddColumnsServers < ActiveRecord::Migration[5.0]
  def change
  	add_column :servers, :stackscript_url, :string
  	add_column :servers, :hostname_server, :string
  end
end
