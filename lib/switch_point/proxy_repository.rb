require 'singleton'
require 'switch_point/proxy'

module SwitchPoint
  class ProxyRepository
    include Singleton

    def self.checkout(name)
      instance.checkout(name)
    end

    def self.find(name)
      instance.find(name)
    end

    def checkout(name)
      key = "#{name}_#{Thread.main.object_id}"
      proxies[key] ||= Proxy.new(name)
    end

    def find(name)
      key = "#{name}_#{Thread.main.object_id}"
      proxies.fetch(key)
    end

    def proxies
      @proxies ||= {}
    end
  end
end
