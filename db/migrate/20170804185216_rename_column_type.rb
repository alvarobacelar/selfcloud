class RenameColumnType < ActiveRecord::Migration[5.0]
  def change
  	remove_column :servers, :type
  end
end
