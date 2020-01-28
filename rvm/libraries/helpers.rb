module Rvm
  module Helpers
    def self.use_rvm?(node)
      rvm_config(node) ? true : false
    end

    def self.rvm_config(node)
      node[:opsworks][:rails_stack][:rvm]
    end

    def self.bundler_bin(node)
      (node and use_rvm?(node)) ? 'bundle' : '/usr/local/bin/bundle'
    end
  end
end

Chef::Recipe.send(:include, ::Rvm::Helpers)
Chef::Resource.send(:include, ::Rvm::Helpers)
Chef::Provider.send(:include, ::Rvm::Helpers)