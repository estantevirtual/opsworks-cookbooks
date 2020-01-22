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
  shell "/bin/sh"
  path "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
  user "root"
  command "/usr/bin/check-puma.sh"
end
