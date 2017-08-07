require 'net/http'
require 'uri'
require 'json'

module ServersHelper

  def servers_collection
 	uri = URI.parse("https://api.linode.com/v4/linode/types")
    response = Net::HTTP.get_response(uri)
    result = JSON.parse response.body
    result['types'].map {|item| [ item['label'], item['id'] ] }
  end
  def distribution_collection
  	uri = URI.parse("https://api.linode.com/v4/linode/distributions")
    response = Net::HTTP.get_response(uri)
    result = JSON.parse response.body
    result['distributions'].map {|item| [ item['label'], item['id'] ] }
  end
  def regions_collection
  	uri = URI.parse("https://api.linode.com/v4/regions")
    response = Net::HTTP.get_response(uri)
    result = JSON.parse response.body
    result['regions'].map {|item| [ item['label'], item['id'] ] }
  end
   def stack_script_collection
  	uri = URI.parse("https://api.linode.com/v4/linode/stackscripts")
    response = Net::HTTP.get_response(uri)
    result = JSON.parse response.body
    result['stackscripts'].map {|item| [ item['stackscripts'] ] }
  end
 #  def list_linode(linodeid)
	# uri = URI.parse("https://api.linode.com/v4/linode/instances/#{linodeid}")
	# request = Net::HTTP::Get.new(uri)
	# request["Authorization"] = "token #{ENV[TOKEN]}"

	# req_options = {
	#   use_ssl: uri.scheme == "https",
	# }

	# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
	#   http.request(request)
	# end
	# result = JSON.parse response.body
	# return result['distribution'].map {|item| [ item['id'] ] }
 #  end

end
