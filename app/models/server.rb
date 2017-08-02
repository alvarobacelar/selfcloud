class Server < ApplicationRecord

  belongs_to :cloud

  before_create :linode_create
  

  def linode_create    
     api_key = Cloud.find(self.cloud_id)
     conect = Linode.new(:api_key => api_key.api_key)
     self.linodeid = conect.linode.create(datacenterId: self.datacenterid, planId: self.planid).linodeid
     
     disk =  conect.linode.disk.create(linodeId: self.linodeid, size: self.size, label: self.label)
     conect.linode.disk.imagize(linodeId: self.linodeid, diskId: disk)
   #  conect.linode.disk.createfromdistribution(linodeId: self.linodeid, distributionId: self.distribuitionid, label: self.label, size: self.size, rootPass: self.rootpass)
 
  end

  # after_create :linode_image_create
  # def linode_image_create
  #   api_key = Cloud.find(self.cloud_id)
  # conect = Linode.new(:api_key => api_key.api_key)
  #   self.linodeid = conect.linode.disk.createfromdistribution(distributionId: '129', labelId: 'CentOS 7', sizeId: '18000', rootPassId: 'ROOTINFOWAY').linodeid
  # end

  def self.list_config_linode(cloud_id, linodeid)
    api_key = Cloud.find(cloud_id)
    conect = Linode.new(:api_key => api_key.api_key)
    @config = conect.linode.config.list(linodeid: linodeid)
  end
end
