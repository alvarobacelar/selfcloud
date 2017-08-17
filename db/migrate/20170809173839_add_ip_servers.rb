class AddIpServers < ActiveRecord::Migration[5.0]
  def change
  	add_column :servers, :ip, :string
  end
end
