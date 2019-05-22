# frozen_string_literal: true
define :puma_upstart do
  memory = node['memory']['total'].split('kb')[0].to_i * 1024

  execute 'puma_restart' do
    cmd = node[:opsworks][:rails_stack][:restart_command]
    Chef::Log.info("!!! executing puma restart with: #{cmd}")
    command cmd
    only_if { File.exists?('/etc/init/puma.conf') }
  end

  template '/etc/init/puma.conf' do
    mode '0644'
    owner 'root'
    group 'root'
    source 'puma.upstart.erb'
    cookbook 'puma'
    notifies :run, 'execute[puma_restart]', :delayed
    only_if { node[:opsworks][:rails_stack][:puma].eql?(true) }
    variables(
        user: params[:user],
        deploy: params[:deploy],
        group: params[:group],
        memory_limit: (memory * 0.40).to_int
    )
  end
end
