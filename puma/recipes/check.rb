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
  command 'sudo su - -c '"/usr/bin/check-puma.sh"'
end
