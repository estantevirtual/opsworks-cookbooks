link "/etc/localtime" do
    to "/etc/localtime"
    action :delete
end

link "/etc/localtime" do
    to "/usr/share/zoneinfo/America/Fortaleza"
    action :create
end