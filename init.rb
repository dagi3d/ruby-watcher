require 'rubygems'
require 'bundler/setup'

# TODO: refactor this
require File.join(File.dirname(__FILE__), '/lib/watcher/config')
require File.join(File.dirname(__FILE__), '/lib/watcher/database')
require File.join(File.dirname(__FILE__), '/lib/watcher/command')
require File.join(File.dirname(__FILE__), '/lib/watcher/capture')
require File.join(File.dirname(__FILE__), '/lib/watcher/logger')

Watcher::Config.load(File.join(File.dirname(__FILE__), 'config.yml'))
