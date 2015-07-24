include_recipe 'chef-sugar'
include_recipe 'curl'
include_recipe 'java'

elasticsearch_user 'elasticsearch'
elasticsearch_install 'elasticsearch'

elasticsearch_configure 'elasticsearch' do
 configuration node['elasticsearch']['config'].to_hash
end

elasticsearch_service 'elasticsearch'

node['elasticsearch']['plugins'].each do |name, config|
  elasticsearch_plugin name do
    url config['url']
  end
end

service 'elasticsearch' do
  action :start
end
