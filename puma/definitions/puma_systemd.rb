# frozen_string_literal: true
define :puma_systemd do
  memory = node['memory']['total'].split('kb')[0].to_i / 1024

  template '/etc/systemd/system/puma.service' do
    mode '0644'
    owner 'root'
    group 'root'
    source 'puma.systemd.erb'
    variables(
      user: params[:user],
      deploy: params[:deploy],
      path: "/srv/#{params[:deploy][:shortname]}",
      memory_limit: memory * 0.40
    )
  end
end
