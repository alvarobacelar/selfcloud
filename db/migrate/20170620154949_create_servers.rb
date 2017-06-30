class CreateServers < ActiveRecord::Migration[5.0]
  def change
    create_table :servers do |t|
      t.string :label
      t.integer :datacenterid
      t.integer :planid
      t.integer :paymentterm
      t.string :lpm_displaygroup
      t.integer :cloud_id

      t.timestamps
    end
  end
end
