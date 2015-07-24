include_recipe 'git'

git node['zombodb']['src']['path'] do
  repository node['zombodb']['src']['repo']
  notifies :run, 'bash[build and install zombodb]', :immediately
end

postgresql_lib_dir = '/usr/lib/postgresql/9.4/lib' #TODO use: pg_config --libdir
postgresql_plugin_dir = File.join(postgresql_lib_dir, 'plugins')
directory postgresql_plugin_dir

bash 'build and install zombodb' do
  cwd node['zombodb']['src']['path']
  code <<-EOH
cd postgres
make clean install
  EOH
  #action :nothing
  notifies :restart, 'service[postgresql]', :delayed
end

link File.join(postgresql_plugin_dir, 'zombodb.so') do
  to File.join(postgresql_lib_dir, 'zombodb.so')
end

postgresql_config_template = "#{node['postgresql']['dir']}/postgresql.conf"

ruby_block 'install zombodb' do
  block do
    node.set['postgresql']['config']['local_preload_libraries'] = 'zombodb.so'
  end
  notifies :create, "template[#{postgresql_config_template}]", :delayed
end

template postgresql_config_template do
  source "postgresql.conf.erb"
  cookbook 'postgresql'
  owner "postgres"
  group "postgres"
  mode 0600
  action :nothing
  notifies :restart, 'service[postgresql]', :immediately
end
