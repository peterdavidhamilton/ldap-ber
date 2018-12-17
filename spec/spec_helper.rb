# frozen_string_literal: true

require 'bundler'
Bundler.setup

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

begin
  require 'pry-byebug'
rescue LoadError
end

require 'ber'

require 'pathname'
SPEC_ROOT = Pathname(__FILE__).dirname
