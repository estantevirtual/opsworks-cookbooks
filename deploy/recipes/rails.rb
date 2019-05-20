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

  if node[:opsworks][:rails_stack][:puma]
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
end
