class AddColumnAsscessKeyIdAndSecretAccessKeyToClouds < ActiveRecord::Migration[5.0]
  def change
    add_column :clouds, :access_key_id, :string
    add_column :clouds, :secret_access_key, :string
  end
end
