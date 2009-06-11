# Copyright (c) 2008-2009 The Rubyists, LLC (effortless systems) <rubyists@rubyists.com>
# Distributed under the terms of the MIT license.
# The full text can be found in the LICENSE file included with this software
#
begin
  require "sequel"
rescue LoadError
  require "rubygems"
  require "sequel"
end
require "logger"
ENV["PGHOST"] = PGHOST = "/tmp"
ENV["PGPORT"] = PGPORT = "5433"
SHM = "/dev/shm"
ENV['PGDATA'] = PGDATA = "#{SHM}/tinycdr"
DB_LOG = Logger.new("/tmp/tinycdr_spec.log")

def runcmd(command)
  IO.popen(command) do |sout|
    out = sout.read.strip
    out.each_line { |l| DB_LOG.info(l) }
  end
  $? == 0
end

def startdb
  return true if runcmd %{pg_ctl status -o "-k /tmp"}
  DB_LOG.info "Starting DB"
  runcmd %{pg_ctl start -w -o "-k /tmp" -l /tmp/tinycdr_db.log}
end

def stopdb
  DB_LOG.info "Stopping DB"
  if runcmd %{pg_ctl status -o "-k /tmp"}
    runcmd %{pg_ctl stop -w -o "-k /tmp"}
  else
    true
  end
end

def initdb
  raise "#{SHM} not found!" unless File.directory?(SHM)
  return true if File.directory?(PGDATA)
  runcmd %{initdb}
end

def createdb
  runcmd %{dropdb tinycdr}
  runcmd %{createdb tinycdr}
end

begin
  raise "initdb failed" unless initdb
  raise "startdb failed" unless startdb
  raise "createdb failed" unless createdb
rescue Errno::ENOENT => e
  $stderr.puts "\n<<<Error>>> #{e}, do you have the postgres tools in your path?"
  exit 1
rescue RuntimeError => e
  $stderr.puts "\n<<<Error>>> #{e}, do you have the postgres tools in your path?"
  exit 1
end
require_relative "../lib/tiny_cdr"
require TinyCDR::LIBROOT/:tiny_cdr/:db
TinyCDR.db = Sequel.postgres("tinycdr", :user => ENV["USER"], :host => PGHOST, :port => PGPORT)
require 'sequel/extensions/migration'
# go to latest migration
Sequel::Migrator.apply(TinyCDR.db, TinyCDR::MIGRATION_ROOT)

require TinyCDR::SPEC_HELPER_PATH/:helper
