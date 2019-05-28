unless node[:opsworks][:skip_uninstall_of_other_rails_stack]
  include_recipe 'apache2::uninstall'
end

include_recipe 'nginx'
include_recipe 'puma'

node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping puma::rails application #{application} as it is not an Rails app")
    next
  end

  puma_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  puma_rails do
    deploy_data deploy
    app application
  end

  puma_web_app do
    application application
    deploy deploy
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
    variables(
      :deploy => deploy,
      :application => application,
      :environment => OpsWorks::Escape.escape_double_quotes(deploy[:environment_variables]),
      :pwk => pwk
    )
  end
end
