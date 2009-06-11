# Copyright (c) 2008-2009 The Rubyists, LLC (effortless systems) <rubyists@rubyists.com>
# Distributed under the terms of the MIT license.
# The full text can be found in the LICENSE file included with this software
#
require File.expand_path("../../lib/tiny_cdr", __FILE__)
require TinyCDR::LIBROOT/:tiny_cdr/:db

require 'sequel/extensions/migration'

desc "migrate to latest version of db"
task :migrate do
    raise "No DB found" unless TinyCDR.db
      require TinyCDR::ROOT/:model/:init
      Sequel::Migrator.apply(TinyCDR.db, TinyCDR::MIGRATION_ROOT)
end

