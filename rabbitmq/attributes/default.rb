# Latest RabbitMQ.com version to install
default['rabbitmq']['version'] = '3.4.4'
# The distro versions may be more stable and have back-ported patches
default['rabbitmq']['use_distro_version'] = false
# Allow the distro version to be optionally pinned like the rabbitmq.com version
default['rabbitmq']['pin_distro_version'] = false

# being nil, the rabbitmq defaults will be used
default['rabbitmq']['nodename']  = nil
default['rabbitmq']['address']  = nil
default['rabbitmq']['port']  = nil
default['rabbitmq']['config'] = nil
default['rabbitmq']['logdir'] = nil
default['rabbitmq']['mnesiadir'] = '/var/lib/rabbitmq/mnesia'
default['rabbitmq']['service_name'] = 'rabbitmq-server'

# config file location
# http://www.rabbitmq.com/configure.html#define-environment-variables
# "The .config extension is automatically appended by the Erlang runtime."
default['rabbitmq']['config_root'] = '/etc/rabbitmq'
default['rabbitmq']['config'] = "#{node['rabbitmq']['config_root']}/rabbitmq"
default['rabbitmq']['erlang_cookie_path'] = '/var/lib/rabbitmq/.erlang.cookie'
# override this if you wish to provide `rabbitmq.config.erb` in your own wrapper cookbook
default['rabbitmq']['config_template_cookbook'] = 'rabbitmq'

# rabbitmq.config defaults
default['rabbitmq']['default_user'] = 'guest'
default['rabbitmq']['default_pass'] = 'guest'

default['rabbitmq']['users_ev'] = false

# loopback_users
# List of users which are only permitted to connect to the broker via a loopback interface (i.e. localhost).
# If you wish to allow the default guest user to connect remotely, you need to change this to [].
default['rabbitmq']['loopback_users'] = nil

# Erlang kernel application options
# See http://www.erlang.org/doc/man/kernel_app.html
default['rabbitmq']['kernel']['inet_dist_listen_min'] = nil
default['rabbitmq']['kernel']['inet_dist_listen_max'] = nil

# Tell Erlang what IP to bind to
default['rabbitmq']['kernel']['inet_dist_use_interface'] = nil

# clustering
default['rabbitmq']['cluster'] = false
default['rabbitmq']['cluster_disk_nodes'] = []
default['rabbitmq']['erlang_cookie'] = 'AnyAlphaNumericStringWillDo'
default['rabbitmq']['cluster_partition_handling'] = 'ignore'

# resource usage
default['rabbitmq']['disk_free_limit_relative'] = nil
default['rabbitmq']['vm_memory_high_watermark'] = nil
default['rabbitmq']['max_file_descriptors'] = 1024
default['rabbitmq']['open_file_limit'] = nil

# job control
default['rabbitmq']['job_control'] = 'initd'

# ssl
default['rabbitmq']['ssl'] = false
default['rabbitmq']['ssl_port'] = 5671
default['rabbitmq']['ssl_cacert'] = '/path/to/cacert.pem'
default['rabbitmq']['ssl_cert'] = '/path/to/cert.pem'
default['rabbitmq']['ssl_key'] = '/path/to/key.pem'
default['rabbitmq']['ssl_verify'] = 'verify_none'
default['rabbitmq']['ssl_fail_if_no_peer_cert'] = false
default['rabbitmq']['web_console_ssl'] = false
default['rabbitmq']['web_console_ssl_port'] = 15_671

# tcp listen options
default['rabbitmq']['tcp_listen'] = true
default['rabbitmq']['tcp_listen_packet'] = 'raw'
default['rabbitmq']['tcp_listen_reuseaddr']  = true
default['rabbitmq']['tcp_listen_backlog'] = 128
default['rabbitmq']['tcp_listen_nodelay'] = true
default['rabbitmq']['tcp_listen_exit_on_close'] = false
default['rabbitmq']['tcp_listen_keepalive'] = true

# virtualhosts
default['rabbitmq']['virtualhosts'] = []
default['rabbitmq']['disabled_virtualhosts'] = []

default['rabbitmq']['disabled_users'] = []

# plugins
default['rabbitmq']['enabled_plugins'] = ["rabbitmq_management",]
default['rabbitmq']['disabled_plugins'] = []
default['rabbitmq']['community_plugins'] = nil

# platform specific settings
case node['platform_family']
when 'smartos'
  default['rabbitmq']['service_name'] = 'rabbitmq'
  default['rabbitmq']['config_root'] = '/opt/local/etc/rabbitmq'
  default['rabbitmq']['config'] = "#{node['rabbitmq']['config_root']}/rabbitmq"
  default['rabbitmq']['erlang_cookie_path'] = '/var/db/rabbitmq/.erlang.cookie'
end

# heartbeat
default['rabbitmq']['heartbeat'] = 80

# HA policies
default['rabbitmq']['policies']['ha-all']['pattern'] = '^(?!amq\\.).*'
default['rabbitmq']['policies']['ha-all']['params'] = { 'ha-mode' => 'all', 'dead-letter-exchange' => 'dead_letter_exchange'  }
default['rabbitmq']['policies']['ha-all']['priority'] = 0

default['rabbitmq']['disabled_policies'] = []

# default custom pass
default['rabbitmq']['custom_pass'] = "rabbit"
default['rabbitmq']['admin_username'] = "rabbit"

# DLX config
default['rabbitmq']['dead_letter_exchange_name'] = "dead_letter_exchange"
default['rabbitmq']['dead_letter_queue_name'] = "dead_letter_queue"

# users
default['rabbitmq']['enabled_users'] =
    [{ :name => 'guest', :password => 'guest', :rights =>
        [{ :vhost => nil, :conf => '.*', :write => '.*', :read => '.*' }]
     },
     { :name => "#{node['rabbitmq']['admin_username']}", :password => "#{node['rabbitmq']['custom_pass']}", :tag => 'administrator', :rights =>
         [{ :vhost => '/', :conf => '.*', :write => '.*', :read => '.*' }]
     }]


# conf
default['rabbitmq']['conf'] = {}
