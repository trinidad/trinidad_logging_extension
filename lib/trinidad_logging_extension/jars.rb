$:.unshift(File.expand_path"../../trinidad-libs", File.dirname(__FILE__))

module Trinidad
  module Extensions
    module LoggingJars
      SLF4J_VERSION = '1.6.1'
      LOG4J_VERSION = '1.2.16'
      LOG4J_EXTRAS_VERSION = '1.1'
      LOGBACK_VERSION = '0.9.29'

      def require_common_jars
        require "slf4j-api-#{SLF4J_VERSION}.jar"
        require "juli-adapters.jar"
        require "jcl-over-slf4j-#{SLF4J_VERSION}.jar"
      end

      def require_log4j_jars
        require "slf4j-log4j12-#{SLF4J_VERSION}.jar"
        require "log4j-#{LOG4J_VERSION}"
        require "jul-to-slf4j-#{SLF4J_VERSION}.jar"
        require "apache-log4j-extras-#{LOG4J_EXTRAS_VERSION}.jar"
      end

      def require_logback_jars
        require "logback-core-#{LOGBACK_VERSION}.jar"
        require "logback-classic-#{LOGBACK_VERSION}.jar"
        require "jul-to-slf4j-#{SLF4J_VERSION}.jar"
      end

      def require_jul_jars
        require "slf4j-jdk14-#{SLF4J_VERSION}.jar"
      end
    end
  end
end
