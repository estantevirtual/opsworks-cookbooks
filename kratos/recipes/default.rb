# inclui o certificado e a key no diretorio correto da aplicacao
bash 'include_certificate' do
    code <<-EOH
      export AWS_ACCESS_KEY_ID=#{node['credentials']['aws_access_key_id']}
      export AWS_SECRET_ACCESS_KEY=#{node['credentials']['aws_secret_access_key']}
      mkdir -p #{node['app_path']}
      /usr/bin/aws s3 cp #{node['cert_path']} #{node['app_path']}
      /usr/bin/aws s3 cp #{node['key_path']} #{node['app_path']}
    EOH
end