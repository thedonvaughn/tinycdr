# Copyright (c) 2008-2009 The Rubyists, LLC (effortless systems) <rubyists@rubyists.com>
# Distributed under the terms of the MIT license.
# See the LICENSE file which accompanies this software for the full text
#
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

module TinyCDR
  unless defined?(@@db)
    @@db = nil
  end

  def self.db
    setup_db
  end

  def self.db=(other)
    @@db = other
  end

  private

  def self.parse_pgpass(file, database)
    dbs = {}

    defaults = {
      host: "localhost", port: 5432, db: database,
      user: ENV["USER"], password: nil
    }

    file.readlines.each do |line|
      chunks = line.strip.split(/:/)
      dbs[chunks[2]] = Hash[defaults.keys.zip(chunks)]
    end

    chosen = (dbs[database] || dbs['*']).reject{|k,v| !v || v == '*' }
    defaults.merge(chosen)
  end

  def self.setup_db
    return @@db if @@db

    app_db  = ENV["APP_DB"]  || "tinycdr"
    app_env = ENV["APP_ENV"] || "development"

    if (pgpass = TinyCDR::ROOT/".pgpass").file?
      conn = parse_pgpass(pgpass, app_db)
    elsif (pgpass = Pathname(ENV["HOME"])/".pgpass").file?
      conn = parse_pgpass(pgpass, app_db)
    end

    logger = ::Logger.new(TinyCDR::ROOT/:log/"#{app_env}.log")

    if app_db.nil?
      logger.debug("setup_db called but no database defined")
      @@db = nil
    else
      logger.info("Connecting to #{app_db}")
      conn[:logger] = logger
      @@db = ::Sequel.postgres(app_db, conn)
    end
  end
end
