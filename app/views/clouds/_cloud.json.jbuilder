json.extract! cloud, :id, :name, :description, :api_key, :cloud_type, :created_at, :updated_at
json.url cloud_url(cloud, format: :json)