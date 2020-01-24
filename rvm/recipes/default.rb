if Rvm::Helpers.use_rvm?(node)
  install_rvm
  install_ruby
else
  Chef::Log.info('This stack doesnt use RVM, skipping rvm install')
  return
end
