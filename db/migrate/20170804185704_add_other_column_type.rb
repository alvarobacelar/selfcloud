class AddOtherColumnType < ActiveRecord::Migration[5.0]
  def change
  	add_column :servers, :linode_type, :string
  end
end
