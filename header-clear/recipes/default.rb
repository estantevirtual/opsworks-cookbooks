#Limpando Kernel Headers.
if platform_family?('debian')
 execute "header clear" do
  command "apt-get --purge autoremove -y"
 end
end	
if platform_family?('rhel')
 execute "header clear" do
  command "yum install yum-utils -y && package-cleanup --oldkernels --count=2 -y"
 end
end