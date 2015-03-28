package 'postgresql' do
  action :install
end
package 'postgresql-server' do
  action :install
end
package 'postgresql-libs' do
  action :install
end
package 'postgresql-devel' do
  action :install
end
package 'postgresql-contrib' do
  action :install
end

execute 'remove ' do
  command "rm -rf /var/lib/pgsql/data"
end

execute 'initdb' do
  user "postgres"
  command "initdb  -D '/var/lib/pgsql/data'"
end

service 'postgresql.service' do
  action [:enable, :start]
end
