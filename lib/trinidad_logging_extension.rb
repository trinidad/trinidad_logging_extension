module Trinidad
  module Extensions
    module Logging
      VERSION = '0.2.1'
    end

    __DIR__ = File.dirname(__FILE__)
    require File.expand_path('../trinidad-libs/juli-adapters', __DIR__)
    require File.expand_path('../trinidad-libs/log4j-1.2.16', __DIR__)

    class LoggingServerExtension < ServerExtension
      def configure(tomcat)
        @options[:config] ||= 'config/trinidad-logging.properties'
        java.lang.System.set_property('log4j.configuration', 
          java.io.File.new(File.expand_path(@options[:config])).to_url.to_s)
      end
    end
  end
end
