default['java']['jdk_version'] = '7'
default['postgresql']['version'] = '9.4'
default['postgresql']['password']['postgres'] = 'postgres'

default['zombodb']['src']['path'] = "#{Chef::Config[:file_cache_path]}/zombodb"
default['zombodb']['src']['repo'] = 'https://github.com/zombodb/zombodb.git'
