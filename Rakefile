begin; require 'rubygems'; rescue LoadError; end

require 'rake'
require 'rake/clean'
require 'time'
require 'date'

Dir['tasks/*.rake'].each{|f| import(f) }

CLEAN.include %w[
  **/.*.sw?
  *.gem
  .config
  **/*~
  **/{data.db,cache.yaml}
  *.yaml
  pkg
  rdoc
  ydoc
  *coverage*
]

