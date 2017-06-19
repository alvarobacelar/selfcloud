class CreateClouds < ActiveRecord::Migration[5.0]
  def change
    create_table :clouds do |t|
      t.string :name
      t.text :description
      t.string :api_key
      t.string :cloud_type

      t.timestamps
    end
  end
end
