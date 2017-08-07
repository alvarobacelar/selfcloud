class RemoveColunasServer < ActiveRecord::Migration[5.0]
  def change
  	 remove_column :servers, :lpm_displaygroup
     remove_column :servers, :distributionvendor
  end
end
