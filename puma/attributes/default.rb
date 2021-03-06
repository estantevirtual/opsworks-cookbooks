include_attribute 'rails::rails'

default[:puma][:recipe] = 'puma::default'
default[:puma][:needs_reload] = true
default[:puma][:service] = 'puma'
default[:puma][:restart_command] = node[:opsworks][:rails_stack][:restart_command]
default[:sleep_before_restart] = 0

default[:puma][:worker_processes] = node[:rails][:max_pool_size] ? node[:rails][:max_pool_size] : 4
default[:puma][:backlog] = 1024
default[:puma][:timeout] = 60
default[:puma][:preload_app] = true
default[:puma][:version] = '2.15.3'
default[:puma][:tcp_nodelay] = true
default[:puma][:tcp_nopush] = false
default[:puma][:tries] = 5
default[:puma][:delay] = 0.5
default[:puma][:accept_filter] = 'httpready'
