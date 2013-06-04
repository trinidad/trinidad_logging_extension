# Trinidad Logging Extension

Extension to enhance the Trinidad's logging by routing it through one of:
 * Log4j (http://logging.apache.org/log4j/index.html)
 * Logback (http://logback.qos.ch/)
 * java.util.logging (http://docs.oracle.com/javase/6/docs/api/java/util/logging/package-summary.html)

[SLF4J](http://www.slf4j.org/) with [jruby-rack](https://github.com/jruby/jruby-rack)'s 
`RackLogger` are used to route logs to the concrete logger implementation.

## Installation

    jruby -S gem install trinidad_logging_extension

## Configuration

The extension needs a configuration file for the chosen logging system. 
The file can be overridden by putting one into your *config* directory:

 * Log4j (Default)
   Default configuration file: 'config/trinidad-logging.properties'
 * Logback
   Default configuration file: 'config/trinidad-logging.xml'
 * java.util.logging
   Default configuration file: 'config/trinidad-logging.properties'


To enable the extension add it to your Trinidad configuration e.g. *trinidad.yml*:

```yml
---
  extensions:
    logging:
      config: other_properties.properties # this field is optional
      logging_system: log4j # (optional) defaults to 'log4j', 'logback' and 'jul' are also valid choices
```

Here's a (.properties) configuration example extracted from the Tomcat's doc:

```
log4j.rootLogger=INFO, R 
log4j.appender.R=org.apache.log4j.RollingFileAppender 
log4j.appender.R.File=log/trinidad.log
log4j.appender.R.MaxFileSize=10MB 
log4j.appender.R.MaxBackupIndex=10 
log4j.appender.R.layout=org.apache.log4j.PatternLayout 
log4j.appender.R.layout.ConversionPattern=%p %t %c - %m%n
```

You can find further information on how to write your own extension in the wiki: 
http://wiki.github.com/calavera/trinidad/extensions

## Copyright

Copyright (c) 2010 David Calavera. See LICENSE for details.
Copyright (c) 2011 Michael Leinartas. See LICENSE for details.
