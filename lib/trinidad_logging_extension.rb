require 'trinidad_logging_extension/jars'
require 'trinidad_logging_extension/version'
module Trinidad
  module Extensions
    class LoggingServerExtension < ServerExtension
      include Trinidad::Extensions::Logging::Jars

      def configure(tomcat)
        @options[:logging_system] ||= 'log4j'
        @options[:config] ||= @options[:logging_system].eql?('logback') ?
           'config/trinidad-logging.xml' : 'config/trinidad-logging.properties'

        require_common_jars

        case @options[:logging_system]
        when 'log4j'
          set_config_property 'log4j.configurationFile'
          require_log4j_jars
          configure_jul_bridge
        when 'logback'
          set_config_property 'logback.configurationFile'
          require_logback_jars
          configure_jul_bridge
        when 'jul', 'jdk14', 'util'
          set_config_property('java.util.logging.config.file', false)
          require_jul_jars
          java.util.logging.LogManager.getLogManager.readConfiguration
        else
          return
        end
      end

      def configure_jul_bridge
        java_import 'org.slf4j.bridge.SLF4JBridgeHandler'
        org.slf4j.bridge.SLF4JBridgeHandler.install
      end

      def set_config_property(property_name, url = true)
        config_file = File.expand_path(@options[:config])
        config_file = java.io.File.new(config_file).to_url.to_s if url
        java.lang.System.set_property(property_name, config_file)
      end
    end

    class LoggingWebAppExtension < WebAppExtension
      
      def configure(tomcat, app_context)
        param_name, param_value = 'jruby.rack.logging', 'slf4j'
        # in-case parameter already defined - we redefine it :
        if value = app_context.findParameter(param_name)
          if value.downcase != param_value
            logger = java.util.logging.Logger.getLogger('')
            logger.warn "changing already defined context parameter #{param_name} (#{value}) for #{app_context.name}"
          end
          # StandartContext throws IAE if parameter already added
          app_context.removeParameter(param_name)
        end
        app_context.addParameter(param_name, param_value)
      end
      
    end
  end
end
