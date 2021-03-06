default['recommendations']['staging']['solr_version'] = "5.3.2-SNAPSHOT"
default['recommendations']['staging']['path'] = "/opt/solr-#{default['recommendations']['staging']['solr_version']}/server/solr/"
default['recommendations']['staging']['core_name'] = "recommendations"
default['recommendations']['staging']['database_url'] = "dev.virtualshelf.net"
default['recommendations']['staging']['cron_delta_import'] = '15 */3 * * *'
default['recommendations']['staging']['database_name'] = "estantevirtual"
default['recommendations']['staging']['database_user'] = "rme-staging"
default['recommendations']['staging']['database_password'] = "NVY96Qb6ub"

default['recommendations']['production']['solr_version'] = "5.3.2-SNAPSHOT"
default['recommendations']['production']['path'] = "/opt/solr-#{default['recommendations']['staging']['solr_version']}/server/solr"
default['recommendations']['production']['core_name'] = "recommendations"
default['recommendations']['production']['database_url'] = "192.168.100.250"
default['recommendations']['production']['database_name'] = "estantevirtual"
default['recommendations']['production']['database_user'] = "rme_prod"
default['recommendations']['production']['database_password'] = "9PkFHBGXfBXP"
default['recommendations']['production']['cron_delta_import'] = '15 * * * *'


default[:logrotate][:rotate] = 2
default[:logrotate][:dateformat] = false # set to '-%Y%m%d' to have date formatted logs
  

