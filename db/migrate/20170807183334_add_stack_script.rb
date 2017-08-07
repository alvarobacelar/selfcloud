class AddStackScript < ActiveRecord::Migration[5.0]
  def change
  	add_column :servers, :stackscript, :string
  end
end
