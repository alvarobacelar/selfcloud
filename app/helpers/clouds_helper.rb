  require 'net/http'
require 'uri'

module CloudsHelper

  # def configList(cloudId, cloud_type, linodeId)
  #   @config = configuration(linodeId: linodeId).first
  # end

 def configList(linodeId)
	uri = URI.parse("https://api.linode.com/v4/linode/instances/")
	request = Net::HTTP::Get.new(uri)
	request["Authorization"] = "token #{ENV[TOKEN]}"

	req_options = {
	  use_ssl: uri.scheme == "https",
	}

	response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
	  http.request(request)
	end

end
end
