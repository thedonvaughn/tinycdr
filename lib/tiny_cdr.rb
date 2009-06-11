# TinyCDR
# (c) 2009 the rubyists (Jayson Vaughn, Tj Vanderpoel, Kevin Berry)
#
require 'pathname'

class Pathname
  def /(target)
    join(target.to_s)
  end
end

$LOAD_PATH.unshift(File.expand_path("../", __FILE__))
module TinyCDR
  ROOT = Pathname($LOAD_PATH.first).join("..").expand_path
  LIBROOT = ROOT/:lib
  MIGRATION_ROOT = ROOT/:db/:migrate
  MODEL_ROOT = ROOT/:model
  SPEC_HELPER_PATH = ROOT/:spec
  VERSION = "0.0.2"
end

require TinyCDR::LIBROOT/:tiny_cdr/:scrub_xml
