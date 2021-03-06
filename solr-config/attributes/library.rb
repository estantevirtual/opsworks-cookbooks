default['library']['staging']['solr_version'] = "5.3.2-SNAPSHOT"
default['library']['staging']['path'] = "/opt/solr-#{default['library']['staging']['solr_version']}/server/"
default['library']['staging']['core_name'] = "library"
default['library']['staging']['database_url'] = "library-sg.c6orwgo57rj2.us-east-1.rds.amazonaws.com:5432"
default['library']['staging']['database_name'] = "library_staging"
default['library']['staging']['database_user'] = "librarysg"
default['library']['staging']['database_password'] = "library-sg"
default['library']['staging']['cron_full_import'] = '0 2 * * *'
default['library']['staging']['cron_delta_import'] = '0,5,10,15,20,25,30,35,40,45,50,55 * * * *'
default['library']['staging']['cron_delta_delete'] = '2,7,12,17,22,27,32,37,42,47,52,57 * * * *'

default['library']['production']['solr_version'] = "5.3.2-SNAPSHOT"
default['library']['production']['path'] = "/opt/solr-#{default['library']['staging']['solr_version']}/server/"
default['library']['production']['core_name'] = "library"
default['library']['production']['database_url'] = "library.c6orwgo57rj2.us-east-1.rds.amazonaws.com"
default['library']['production']['database_name'] = "library_production"
default['library']['production']['database_user'] = "libraryprod"
default['library']['production']['database_password'] = "password"
default['library']['production']['cron_full_import'] = '0 2 * * *'
default['library']['production']['cron_delta_import'] = '0,5,10,15,20,25,30,35,40,45,50,55 * * * *'
default['library']['production']['cron_delta_delete'] = '4,9,14,19,24,29,34,39,44,49,54,59 * * * *'


default[:logrotate][:rotate] = 2
default[:logrotate][:dateformat] = false # set to '-%Y%m%d' to have date formatted logs


