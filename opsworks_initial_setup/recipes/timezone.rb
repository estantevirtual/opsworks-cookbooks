file '/etc/localtime' do
    action :delete
    only_if { File.exist? '/etc/localtime' }
end

execute "timezone" do
    command "yes | cp -rf  /usr/share/zoneinfo/America/Fortaleza /etc/localtime"
    action :nothing
end