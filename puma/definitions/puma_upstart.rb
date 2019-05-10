# frozen_string_literal: true
define :puma_upstart do
  memory = node['memory']['total'].split('kb')[0].to_i * 1024

  template '/etc/init/puma.conf' do
    mode '0644'
    owner 'root'
    group 'root'
    source 'puma.upstart.erb'
    variables(
        user: params[:user],
        deploy: params[:deploy],
        group: params[:group],
        memory_limit: memory * 0.40
    )
  end
end
