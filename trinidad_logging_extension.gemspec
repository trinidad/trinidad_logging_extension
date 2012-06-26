# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'trinidad_logging_extension/version'

Gem::Specification.new do |s|

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name              = 'trinidad_logging_extension'
  s.version           = Trinidad::Extensions::Logging::VERSION
  s.rubyforge_project = 'trinidad_logging_extension'

  ## Make sure your summary is short. The description may be as long
  ## as you like.
  s.summary     = "Logging extension for Trinidad"
  s.description = "Configure logging service for Trinidad"

  ## List the primary authors. If there are a bunch of authors, it's probably
  ## better to set the email to an email list or something. If you don't have
  ## a custom homepage, consider using your GitHub URL or the like.
  s.authors  = ["David Calavera"]
  s.email    = 'calavera@apache.org'
  s.homepage = 'http://github.com/trinidad/trinidad_logging_extension'

  ## This gets added to the $LOAD_PATH so that 'lib/NAME.rb' can be required as
  ## require 'NAME.rb' or'/lib/NAME/file.rb' can be as require 'NAME/file.rb'
  s.require_paths = %w[lib]

  ## Specify any RDoc options here. You'll want to add your README and
  ## LICENSE files to the extra_rdoc_files list.
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  ## List your runtime dependencies here. Runtime dependencies are those
  ## that are needed for an end user to actually USE your code.
  s.add_dependency('trinidad', '>= 1.0.0')

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  #s.add_development_dependency('rspec')
  #s.add_development_dependency('mocha')

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  s.files = `git ls-files`.split("\n").sort.
    reject { |file| file =~ /^\./ }.
    reject { |file| file =~ /^(rdoc|pkg|src|rakelib)/ }

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  #s.test_files = s.files.select { |path| path =~ /^spec\/.*_spec\.rb/ }
  
end
