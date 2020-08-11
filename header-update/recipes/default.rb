#Instalando Kernel Headers faltantes.
if platform_family?('debian')
 execute "header install" do
  command "apt-get -f install -y"
 end
end	
if platform_family?('rhel')
 execute "header install" do
  command "yum install kernel-devel -y"
 end
end