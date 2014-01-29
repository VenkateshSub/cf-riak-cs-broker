ENV["RACK_ENV"] = "test"
require File.expand_path('../../lib/riak_cs_broker/config', __FILE__)
RiakCsBroker::Config.load_config(File.expand_path('../config/broker.yml', __FILE__))

require File.expand_path('../../lib/riak_cs_broker/app', __FILE__)

module RiakCsBrokerApp
  def app
    @app ||= RiakCsBroker::App.new
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include JsonSpec::Helpers
  config.include RiakCsBrokerApp

  config.treat_symbols_as_metadata_keys_with_true_values = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.before(:each, :authenticated) do
    authorize RiakCsBroker::Config['basic_auth']['username'], RiakCsBroker::Config['basic_auth']['password']
  end
end