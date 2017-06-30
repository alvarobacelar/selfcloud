module CloudsHelper

  def configList(cloudId, cloud_type, linodeId)
    @config = configuration(linodeId: linodeId).first
  end

end
