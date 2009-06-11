# Copyright (c) 2008-2009 The Rubyists, LLC (effortless systems) <rubyists@rubyists.com>
# Distributed under the terms of the MIT license.
# The full text can be found in the LICENSE file included with this software
#
begin; require 'rubygems'; rescue LoadError; end

require 'rake'
require 'rake/clean'
require 'time'
require 'date'
require "lib/tiny_cdr"

PROJECT_SPECS = FileList[
    'spec/*/**/*.rb'
]

IGNORE_FILES = [/\.gitignore/]

GEMSPEC = Gem::Specification.new{|s|
  s.name         = 'tinycdr'
  s.author       = "Jayson Vaughn"
  s.summary      = "TinyCDR, by The Rubyists, LLC"
  s.description  = "TinyCDR, by The Rubyists, LLC"
  s.email        = 'rubyists@rubyists.com'
  s.homepage     = 'http://code.rubyists.com/projects/tinycdr'
  s.platform     = Gem::Platform::RUBY
  s.version      = (ENV['PROJECT_VERSION'] || (begin;Object.const_get(PROJECT_MODULE)::VERSION;rescue;Date.today.strftime("%Y.%m.%d");end))
  s.files        = `git ls-files`.split("\n").sort.reject { |f| IGNORE_FILES.detect { |exp| f.match(exp)  } }
  s.has_rdoc     = true
  s.require_path = 'lib'


  s.post_install_message = <<MESSAGE.strip
============================================================

Thank you for installing TinyCDR!

============================================================
MESSAGE
}



Dir['tasks/*.rake'].each{|f| import(f) }

task :default => [:bacon]
