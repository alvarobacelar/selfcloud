class AdicionarDiscoLinode < ActiveRecord::Migration[5.0]
  def change
  	add_column :servers, :distribuitionid, :integer
   	add_column :servers, :size, :integer
  	add_column :servers, :rootpass, :string

  end
end
