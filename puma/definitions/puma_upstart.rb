# frozen_string_literal: true
define :puma_upstart do
  memory = node['memory']['total'].split('kb')[0].to_i * 1024

  execute 'puma_restart' do
    command node[:opsworks][:rails_stack][:restart_command]
  end

  template '/etc/init/puma.conf' do
    mode '0644'
    owner 'root'
    group 'root'
    source 'puma.upstart.erb'
    notifies :run, 'execute[puma_restart]', :delayed
    variables(
        user: params[:user],
        deploy: params[:deploy],
        group: params[:group],
        memory_limit: (memory * 0.40).to_int
    )
  end
end
