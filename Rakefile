# frozen_string_literal: true

if ENV['PRY']
  begin
    require 'pry-byebug'
  rescue LoadError
  end
end

require 'bundler/gem_tasks'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: %i[spec]
