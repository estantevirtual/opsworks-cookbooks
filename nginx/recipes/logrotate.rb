# deleta a configuracao de logrotate antiga do nginx
file '/etc/logrotate.d/nginx' do
    action :delete
end

# cria o arquivo de logrotate do nginx 
template '/etc/logrotate.d/nginx' do
    source 'nginx.erb'
    owner 'root'
    group 'root'
    mode '0644'
end
