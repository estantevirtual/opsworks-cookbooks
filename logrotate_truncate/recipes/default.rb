#
# Cookbook:: logrotate_truncate
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node["opsworks"].nil? || node["opsworks"]["applications"].nil? then
	app_list = []
else
	app_list = node["opsworks"]["applications"]
end

if node["logtruncate"].nil? || node["logtruncate"]["paths"].nil? then
	path_list = []
else
	path_list = node["logtruncate"]["paths"]
end

if node["logtruncate"].nil? || node["logtruncate"]["custom_cron"].nil? then
	custom_cron = {"minute"=>"*/10","hour"=>"*","weekday"=>"*"}
else
        custom_cron = node["logtruncate"]["custom_cron"]
end

template '/etc/truncate_logfiles.conf' do
	source 'truncate_logfiles.conf.erb'
	variables({
		apps: app_list,
		logpaths: path_list
	})
end

template '/usr/bin/truncate_logfile.sh' do
	source 'truncate_logfile.sh.erb'
	owner 'root'
	group 'root'
	mode '0755'
end

cron 'truncate_logs' do
	action :create
	minute custom_cron["minute"] 
	hour custom_cron["hour"]
	weekday custom_cron["weekday"]
	user 'root'
	command '/usr/bin/truncate_logfile.sh'
end
