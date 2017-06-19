class Cloud < ApplicationRecord

  def self.conecta(id, type)
    if type == "linode"
      api_key = Cloud.where(id: id, cloud_type: type).first
      linode = Linode.new(:api_key => api_key.api_key)
    elsif type == "digitalocean"
      access_token = Cloud.where(id: id, cloud_type: type).first
      digitalocean = DropletKit::Client.new(access_token: access_token.api_key)
    end
  end

end
