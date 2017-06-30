class Server < ApplicationRecord

  belongs_to :cloud

  before_create :linode_create

  def linode_create
    api_key = Cloud.find(self.cloud_id)
    conect = Linode.new(:api_key => api_key.api_key)
    self.linodeid = conect.linode.create(datacenterId: self.datacenterid, planId: self.planid).linodeid
  end

  def self.list_config_linode(cloud_id, linodeid)
    api_key = Cloud.find(cloud_id)
    conect = Linode.new(:api_key => api_key.api_key)
    @config = conect.linode.config.list(linodeid: linodeid)
  end
end
