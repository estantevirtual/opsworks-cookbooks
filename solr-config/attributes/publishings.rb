default[:publishings][:staging][:path] = "/opt/solr-5.2.1/server/solr"
default[:publishings][:staging][:core_name] = "publishings"

default[:publishings][:production][:path] = "/opt/solr-5.2.1/server/solr"
default[:publishings][:production][:core_name] = "publishings"


default[:logrotate][:rotate] = 2
default[:logrotate][:dateformat] = false # set to '-%Y%m%d' to have date formatted logs
  
