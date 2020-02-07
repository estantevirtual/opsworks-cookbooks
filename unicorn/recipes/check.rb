template '/usr/bin/check-unicorn.sh' do
  group 'root'
  user 'root'
  mode '555'
  source 'check.sh.erb'
end

cron 'setup cron' do
  minute "*/2"
  hour "*"
  weekday "*"
  shell "/bin/sh"
  path "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
  user "root"
  command "/usr/bin/check-unicorn.sh"
end
