 require 'net/http'
 require 'uri'
 require 'json'
class Server < ApplicationRecord

 belongs_to :cloud

 before_create :linode_create
 def linode_create
    uri = URI.parse("https://api.linode.com/v4/linode/instances")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Authorization"] = "token #{ENV['TOKEN']}"
    request.body = JSON.dump({
      "type"         => "#{self.linode_type}",
      "region"       => "#{self.region}",
      "distribution" => "#{self.distribution}",
      "root_pass"    => "#{self.rootpass}",
      "label"        => "#{self.label}",
      "group"        => "#{self.group}",
      "status"       => "running",
      #{}"#stackscript_data" => "#[..]
       #                      /usr/bin/hostnamectl set-hostname teste"
       "stackscript"  => "152138"
    })

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    # result = JSON.parse response.body
    # result = result['distributions'].map {|item| [item['id'] ] }
    #linode result
  end


  # def self.list_config_linode(result)
  #  uri = URI.parse("https://api.linode.com/v4/linode/instances/")
  # request = Net::HTTP::Get.new(uri)
  # request["Authorization"] = "token #{ENV[TOKEN]}"

  # req_options = {
  #   use_ssl: uri.scheme == "https",
  # }

  # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  #   http.request(request)
  # end
  # result = JSON.parse response.body
  # result['distribution'].map {|item| [ item['id'],item['label'],item['ipv4'] ] }
  # end
end
