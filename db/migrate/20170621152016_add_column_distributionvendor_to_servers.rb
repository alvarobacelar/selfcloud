class AddColumnDistributionvendorToServers < ActiveRecord::Migration[5.0]
  def change
    add_column :servers, :distributionvendor, :string
    add_column :servers, :linodeid, :integer
    add_column :servers, :totalhd, :integer
    add_column :servers, :backupweeklyday, :integer
    add_column :servers, :backupwindow, :integer
    add_column :servers, :totalram, :integer
    add_column :servers, :status, :integer
    add_column :servers, :backupenabled, :integer
    add_column :servers, :ipaddress_public, :string
    add_column :servers, :ipaddress_private, :integer
    add_column :servers, :rdns_name, :string
    add_column :servers, :watchdog, :integer
    add_column :servers, :alert_bwquota_enabled, :integer
    add_column :servers, :alert_diskio_threshold, :integer
    add_column :servers, :alert_bwout_enabled, :integer
    add_column :servers, :alert_bwout_threshold, :integer
    add_column :servers, :alert_bwin_threshold, :integer  
    add_column :servers, :alert_bwquota_threshold, :integer
    add_column :servers, :alert_cpu_enabled, :integer
    add_column :servers, :alert_cpu_threshold, :integer
    add_column :servers, :alert_diskio_enabled, :integer
    add_column :servers, :alert_bwin_enabled, :integer
    add_column :servers, :isxen, :integer
    add_column :servers, :iskvm, :integer
  end
end
