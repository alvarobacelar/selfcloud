class AddColumnStatus < ActiveRecord::Migration[5.0]
  def change
  	add_column :servers, :status, :boolean
  end
end
