module OpsWorks
  module Helper
    class << self
      def total_memory(node)
        node['memory']['total'].split('kb')[0].to_i / 1024
      end

      def gem_installed?(deploy, gem)
        gem_list(deploy).include?(gem)
      end

      def gem_list(deploy)
        bundle_list = `cd #{deploy[:current_path]}; /usr/local/bin/bundle list`
        Chef::Log.info("!!! bundle_list #{bundle_list}")
        bundle_list
      end
    end
  end
end
