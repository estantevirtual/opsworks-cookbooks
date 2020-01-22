template '/usr/bin/check-puma.sh' do
  group 'root'
  user 'root'
  mode '555'
  source 'check.sh.erb'
end

cron 'setup cron' do
  action :run
  minute "*/1"
  hour "*"
  weekday "*"
  user 'root'
  command '/usr/bin/check-puma.sh'
end
