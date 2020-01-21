include_recipe 'deployer'

template '/usr/bin/check-unicorn.sh' do
  owner node['deployer']['user']
  group node['deployer']['group']
  mode '555'
  source 'check.sh.erb'
end


template '/etc/cron.d/check' do
  owner node['deployer']['user']
  group node['deployer']['group']
  mode '555'
  source 'crontab.erb'
end

execute 'setup node' do
  command "sudo su - crontab /etc/cron.d/check"
end
