define :install_rvm do
  apt_package 'gnupg2' do
    action :install
  end

  execute 'install rvm gpg key' do
    command 'sudo su - deploy -c "gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB"'
  end

  execute 'install rvm' do
    command 'sudo su - deploy -c "\curl -sSL https://get.rvm.io | bash -s stable"'
  end
end

define :install_ruby do
  rvm_config = Rvm::Helpers.rvm_config(node)
  ruby_version = rvm_config[:ruby_version]
  ruby_gemset = rvm_config[:ruby_gemset]

  execute 'install ruby' do
    command "sudo su - deploy -c 'rvm install #{ruby_version}'"
  end

  execute 'create gemset' do
    command "sudo su - deploy -c 'rvm use #{ruby_version}@#{ruby_gemset} --create && gem install bundler -v 1.16.0'"
  end
end
