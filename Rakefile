# frozen_string_literal: true

require "bundler/gem_tasks"
require "rubocop/rake_task"

require "rspec/core/rake_task"
require "rainbow/ext/string" unless String.respond_to?(:color)

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:rubocop)

task default: [:spec, :rubocop]
