class AdicionarColunasServers < ActiveRecord::Migration[5.0]
  def change
  	add_column :servers, :type, :string
  	add_column :servers, :region, :string
  	add_column :servers, :distribution, :string
  	add_column :servers, :group, :string
  end
end
