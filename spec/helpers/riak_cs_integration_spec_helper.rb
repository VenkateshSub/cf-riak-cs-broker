require 'fog'

module RiakCsIntegrationSpecHelper
  class << self
    def bucket_exists?(bucket_name)
      !fog_client.directories.get(bucket_name).nil?
    end

    private

    def fog_options
      {
        provider: 'AWS',
        path_style: true
      }
    end

    def riak_cs_credentials
      {
        host: ENV["RIAK_CS_HOST"],
        port: ENV["RIAK_CS_PORT"],
        scheme: ENV["RIAK_CS_SCHEME"] || 'http',
        aws_access_key_id: ENV["RIAK_CS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["RIAK_CS_SECRET_ACCESS_KEY"]
      }
    end

    def fog_client
      Fog::Storage.new(fog_options.merge(riak_cs_credentials))
    end
  end
end