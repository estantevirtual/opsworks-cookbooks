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
end
