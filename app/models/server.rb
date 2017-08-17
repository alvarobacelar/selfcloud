 require 'rubygems'
 require 'net/ssh'
 require 'net/http'
 require 'uri'
 require 'json'
class Server < ApplicationRecord

 belongs_to :cloud
 
 after_create :linode_create
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
      "stackscript"  => "152138"
    })

    req_options = {use_ssl: uri.scheme == "https"
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    result = JSON.parse response.body
    server = Server.where(label: self.label)
    
    ipaddress = result["ipv4"]
    idlinode = result["id"].to_s

    server.update_all :ip => ipaddress.map { |i| i.to_s}.join("\n"), :linodeid => idlinode
end



def start_server

    uri = URI.parse("https://api.linode.com/v4/linode/instances/#{self.linodeid}/boot")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Authorization"] = "token #{ENV['TOKEN']}"
    request.body = JSON.dump({
      "config" => 5567
    })

    req_options = {use_ssl: uri.scheme == "https"}

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

end
def initial_setup
  hostname = "#{self.ip}"
  username = "root"
  password = "#{self.rootpass}"
  cmd = "hostnamectl set-hostname #{self.label} && curl -s  #{self.stackscript_url} | bash"
  puts "#{hostname}"

   begin
      ssh = Net::SSH.start(hostname, username, :password => password)
      res = ssh.exec!(cmd)
      ssh.close
      puts res
    rescue
      puts "Unable to connect to #{hostname} using #{username}/#{password}"
    end
  end


end
