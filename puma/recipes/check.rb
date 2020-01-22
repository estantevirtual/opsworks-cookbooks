template '/usr/bin/check-puma.sh' do
  group 'root'
  user 'root'
  mode '555'
  source 'check.sh.erb'
end

cron 'setup cron' do
  minute "*/1"
  hour "*"
  weekday "*"
  user 'root'
  command '/usr/bin/check-puma.sh'
end


file('/usr/bin/check-puma.sh') { action :delete }
