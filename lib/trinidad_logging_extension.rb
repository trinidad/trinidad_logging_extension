module Trinidad
  module Extensions
    module Logging
      VERSION = '1.0.0'
    end

    require 'trinidad_logging_extension/jars'

    class LoggingServerExtension < ServerExtension
      include Trinidad::Extensions::LoggingJars

      def configure(tomcat)
        @options[:logging_system] ||= 'log4j'
        @options[:config] ||= @options[:logging_system].eql? 'logback' ?
           'config/trinidad-logging.xml' : 'config/trinidad-logging.properties'

        require_common_jars

        case @options[:logging_system]
        when 'log4j'
          set_config_property 'log4j.configuration'
          require_log4j_jars
          configure_jul_bridge
        when 'logback'
          set_config_property 'logback.configurationFile'
          require_logback_jars
          configure_jul_bridge
        when 'jul', 'jdk14', 'util'
          set_config_property('java.util.logging.config.file', false)
          require_jul_jars
          java_import 'java.util.logging.LogManager'
          java.util.logging.LogManager.getLogManager.readConfiguration
        else
          return
        end
      end

      def configure_jul_bridge
        java_import 'org.slf4j.bridge.SLF4JBridgeHandler'
        org.slf4j.bridge.SLF4JBridgeHandler.install
      end

      def set_config_property(property_name, url=true)
        config_file = File.expand_path(@options[:config])
        if url
          config_file = java.io.File.new(config_file).to_url.to_s
        end
        java.lang.System.set_property(property_name, config_file)
      end
    end

    class LoggingWebAppExtension < WebAppExtension
      def configure(tomcat, app_context)
        app_context.add_parameter('jruby.rack.logging', 'slf4j')
      end
    end
  end
end
