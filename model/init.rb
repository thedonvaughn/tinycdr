# Here goes your database connection and options:
require 'sequel'
require 'logger'

require_relative '../lib/tiny_cdr'
require TinyCDR::LIBROOT/:tiny_cdr/:db
raise "No DB available" unless TinyCDR.db


# Here go your requires for models:
# require 'model/user'
require_relative 'call'
