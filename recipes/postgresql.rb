include_recipe 'postgresql::server'

# Development dependencies.
package "postgresql-server-dev-#{node['postgresql']['version']}"
package 'libcurl4-gnutls-dev'
