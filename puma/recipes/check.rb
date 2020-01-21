include_recipe 'nginx'
include_recipe 'puma'

node[:deploy].each do |application, deploy|
  template '/usr/bin/check-puma.sh' do
    mode '555'
    source 'check.sh.erb'
  end

  template '/etc/cron.d/check' do
    mode '555'
    source 'crontab.erb'
  end

  execute 'setup node' do
    command "sudo su - crontab /etc/cron.d/check"
  end
end
