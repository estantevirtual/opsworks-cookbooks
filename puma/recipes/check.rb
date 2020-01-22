node[:deploy].each do |application, deploy|
  template '/usr/bin/check-puma.sh' do
    group deploy[:group]
    user deploy[:user]
    mode '555'
    source 'check.sh.erb'
  end

  cron 'setup cron' do
    action :create
    minute "*/1"
    hour "*"
    weekday "*"
    user 'root'
    command '. /usr/bin/check-puma.sh'
  end
end
