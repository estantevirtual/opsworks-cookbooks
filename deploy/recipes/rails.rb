include_recipe 'deploy'
include_recipe 'puma::rails'

node[:deploy].each do |application, deploy|

  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping deploy::rails application #{application} as it is not a Rails app")
    next
  end

  opsworks_deploy_user do
    deploy_data deploy
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group 'www-data'
    path deploy[:deploy_to]
  end

  opsworks_rails do
    deploy_data deploy
    app application
  end

  if node[:opsworks][:rails_stack][:puma].eql?(true)
    puma_upstart do
      user deploy[:user]
      group 'www-data'
      deploy deploy
    end
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end

  template "#{deploy[:deploy_to]}/shared/config/puma.rb" do
    Chef::Log.info("!!! deploy #{deploy}")

    memory = node['memory']['total'].split('kb')[0].to_i / 1024
    pwk = Hash.new
    gemfile = "#{deploy[:current_path]}/Gemfile"
    gems = ''

    File.open(gemfile) { |f| gems = f.read() } if File.exists?(gemfile)

    Chef::Log.info("!!! gemfile: #{gemfile}")
    Chef::Log.info("!!! gems: #{gems}")

    if gems.include?('puma_worker_killer')
      pwk[:memory] = memory
    end

    mode '0644'
    owner deploy[:user]
    group 'www-data'
    source 'puma.conf.erb'
    cookbook 'puma'
    notifies :run, 'execute[puma_restart]', :delayed
    variables(
      :deploy => deploy,
      :application => application,
      :environment => OpsWorks::Escape.escape_double_quotes(deploy[:environment_variables]),
      :pwk => pwk
    )
  end
end
