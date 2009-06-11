# Copyright (c) 2008-2009 The Rubyists, LLC (effortless systems) <rubyists@rubyists.com>
# Distributed under the terms of the MIT license.
# The full text can be found in the LICENSE file included with this software
#
require File.expand_path('../../app', __FILE__)
require 'hpricot'
require 'ramaze/spec'
Ramaze::Log.loggers = [Logger.new(TinyCDR::ROOT/:log/"ramaze_spec.log")]

Ramaze.options.roots = [TinyCDR::ROOT]
