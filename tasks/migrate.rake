# Copyright (c) 2008-2009 The Rubyists, LLC (effortless systems) <rubyists@rubyists.com>
# Distributed under the terms of the MIT license.
# The full text can be found in the LICENSE file included with this software
#
require 'pathname'
require 'model/init'
require 'sequel/extensions/migration'
desc "migrate to latest version of db"
task :migrate do
  TINYCDR_ROOT = 'db/migrate'
  puts TINYCDR_ROOT.to_s
  Sequel::Migrator.run(DB, TINYCDR_ROOT.to_s)
end
