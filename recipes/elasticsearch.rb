include_recipe 'java'

include_recipe 'chef-sugar'
include_recipe 'curl'

elasticsearch_user 'elasticsearch'
elasticsearch_install 'elasticsearch'
elasticsearch_configure 'elasticsearch' do
  configuration ({
    'script.disable_dynamic' => false,
    'threadpool.bulk.queue_size' => 1024,
    'threadpool.bulk.size' => 12,
    'http.max_content_length' => '1024mb',
    'index.query.bool.max_clause_count' => 1000000
  })
end

elasticsearch_service 'elasticsearch'

elasticsearch_plugin 'zombodb' do
  url 'https://github.com/zombodb/zombodb/releases/download/2.1.35/zombodb-plugin-2.1.35.zip'
end

service 'elasticsearch' do
  action :start
end
