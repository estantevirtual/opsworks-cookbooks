node[:deploy].each do |application, deploy|
  template '/usr/bin/check-puma.sh' do
    user 'root'
    group 'root'
    mode '555'
    source 'check.sh.erb'
  end

  custom_cron = {"minute"=>"*/10","hour"=>"*","weekday"=>"*"}

  cron 'setup cron' do
    action :create
    minute "*/10"
    hour "*"
    weekday "*"
    user 'root'
    command '/usr/bin/check-puma.sh'
  end
end
