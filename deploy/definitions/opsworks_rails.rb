define :opsworks_rails do
  deploy = params[:deploy_data]
  application = params[:app]
  cookbook = node[:opsworks][:rails_stack][:recipe]

  Chef::Log.info("!!! incluindo receita: #{cookbook}")

  include_recipe cookbook

  # write out memcached.yml
  template "#{deploy[:deploy_to]}/shared/config/memcached.yml" do
    cookbook "rails"
    source "memcached.yml.erb"
    mode "0660"
    owner deploy[:user]
    group deploy[:group]
    variables(:memcached => (deploy[:memcached] || {}), :environment => deploy[:rails_env])

    only_if do
      deploy[:memcached][:host].present?
    end
  end

  execute "symlinking subdir mount if necessary" do
    command "rm -f /var/www/#{deploy[:mounted_at]}; ln -s #{deploy[:deploy_to]}/current/public /var/www/#{deploy[:mounted_at]}"
    action :run
    only_if do
      deploy[:mounted_at] && File.exists?("/var/www")
    end
  end

end 
