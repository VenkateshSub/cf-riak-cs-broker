# Riak CS Service Broker for Cloud Foundry 

This is a [Riak CS](http://basho.com/riak-cloud-storage/) service broker for the Cloud Foundry [v2 services API](http://docs.cloudfoundry.com/docs/running/architecture/services/api.html).

This service broker allows users to provision instances of an S3-compatible storage service.
Provisioning the service creates a Riak CS bucket.
Binding an application creates unique credentials for that application to access the bucket.

Based on [the Riak service broker by @hectcastro](https://github.com/hectcastro/cf-riak-service-broker).

### Prerequisites 

This service broker must be configured to access a Riak CS cluster.
You can use Bosh to deploy such a cluster alongside Cloud Foundry, or it can be deployed locally by [bosh-lite](https://github.com/cloudfoundry/bosh-lite) for development purposes.
A Bosh release for Riak and Riak CS can be found [here](https://github.com/cf-blobstore-eng/riak-release).

### Usage 

The [broker.yml.example](config/broker.yml.example) file provides a template for your broker configuration.
Copy it, rename it to `broker.yml`, and make changes accordingly.

Start the Riak CS Service Broker:

```
bundle exec rackup
```

Add the broker to Cloud Foundry as described by [the service broker documentation](http://docs.cloudfoundry.com/docs/running/architecture/services/managing-service-brokers.html).