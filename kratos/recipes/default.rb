# exporta variaveis das credenciais de acesso 
bash 'set_env_var' do
    code <<-EOH
      export AWS_ACCESS_KEY_ID=<%= node.credentials.aws_access_key_id %> && \
      export AWS_SECRET_ACCESS_KEY=<%= node.credentials.aws_secret_access_key %>
    EOH
end