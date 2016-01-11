
node[:deploy].each do |application, deploy|

  deploy = node[:deploy][application]

  Chef::Log.info("Catching the application data from #{deploy[:application]}")
  Chef::Log.info("Environment: RAILS_ENV #{deploy[:rails_env]}")

  node.set[:srvlog][:group_name] = node[:opsworks][:stack][:name].gsub("_","").split().join().capitalize

  if deploy[:rails_env] == "staging"
    node.set[:srvlog] = [{:logfile => "/srv/www/#{deploy[:application]}/current/log/staging.log",
                :buffer_duration => 5000,
                :initial_position => "start_of_file",
                :log_group_name => node[:srvlog][:group_name],
                :log_stream_name => "staging",
                :datetime_format => false
               }, ]
  else
    node.set[:srvlog] = [{:logfile => "/srv/www/#{deploy[:application]}/current/log/production.log",
                :buffer_duration => 5000,
                :initial_position => "start_of_file",
                :log_group_name => node[:srvlog][:group_name],
                :log_stream_name => "production",
                :datetime_format => false
               }, ]
  end

  node.set[:srvlog] << {:logfile => "/srv/www/#{deploy[:application]}/current/log/unicorn.stderr.log",
                :buffer_duration => 5000,
                :initial_position => "start_of_file",
                :log_group_name => node[:srvlog][:group_name],
                :log_stream_name => "unicorn-error",
                :datetime_format => false
               }

  node.set[:srvlog] << {:logfile => "/srv/www/#{deploy[:application]}/current/log/unicorn.stdout.log",
              :buffer_duration => 5000,
              :initial_position => "start_of_file",
              :log_group_name => node[:srvlog][:group_name],
              :log_stream_name => "unicorn-out",
              :datetime_format => false
             } 
end

Chef::Log.info("Rasing the config file")
template "/tmp/cwlogs.cfg" do
  cookbook "awslogs"
  source "cwlogs.cfg.erb"
  owner "root"
  group "root"
  mode 0644
  variables(:srvlog => node[:srvlog] )
end
Chef::Log.info("Config file successfully created")