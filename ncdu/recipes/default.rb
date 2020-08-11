#Instalando Pacote ncdu
package 'ncdu' do
 case node[:platform]
 when 'centos','redhat','fedora','amazon', 'debian', 'ubuntu'
  package_name 'ncdu'
  action :install
 else
  action :nothing
 end
end