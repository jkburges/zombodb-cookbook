default['java']['jdk_version'] = '7'

default['elasticsearch']['config']['script.disable_dynamic'] = false
default['elasticsearch']['config']['threadpool.bulk.queue_size'] = 1024
default['elasticsearch']['config']['threadpool.bulk.size'] = 12
default['elasticsearch']['config']['http.max_content_length'] = '1024mb'
default['elasticsearch']['config']['index.query.bool.max_clause_count'] = 1000000

default['elasticsearch']['plugins'] = {
  'zombodb' => { 'url' => 'https://github.com/zombodb/zombodb/releases/download/2.1.35/zombodb-plugin-2.1.35.zip' }
}

default['postgresql']['version'] = '9.4'
default['postgresql']['password']['postgres'] = 'postgres'

default['zombodb']['src']['path'] = "#{Chef::Config[:file_cache_path]}/zombodb"
default['zombodb']['src']['repo'] = 'https://github.com/zombodb/zombodb.git'
