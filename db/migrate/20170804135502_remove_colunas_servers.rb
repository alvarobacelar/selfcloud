class RemoveColunasServers < ActiveRecord::Migration[5.0]
  def change

	remove_column :servers,  :alert_bwquota_enabled
    remove_column :servers,  :alert_diskio_threshold
    remove_column :servers,  :alert_bwout_enabled
    remove_column :servers,  :alert_bwout_threshold
    remove_column :servers,  :alert_bwin_threshold
    remove_column :servers,  :alert_bwquota_threshold
    remove_column :servers,  :alert_cpu_enabled
    remove_column :servers,  :alert_cpu_threshold
    remove_column :servers,  :alert_diskio_enabled
    remove_column :servers,  :alert_bwin_enabled
    remove_column :servers,  :totalhd
    remove_column :servers,  :backupweeklyday
    remove_column :servers,  :backupwindow
    remove_column :servers,  :totalram
    remove_column :servers,  :status
    remove_column :servers,  :backupenabled
    remove_column :servers,  :ipaddress_public
    remove_column :servers,  :ipaddress_private
    remove_column :servers,  :rdns_name
    remove_column :servers,  :watchdog
    remove_column :servers,  :isxen
    remove_column :servers,  :iskvm
    remove_column :servers,  :distribuitionid
    remove_column :servers,  :size
    remove_column :servers,  :datacenterid
    remove_column :servers,  :planid
    remove_column :servers,  :paymentterm

  end
end
