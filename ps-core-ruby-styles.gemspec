# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = "ps-core-ruby-styles"
  spec.version     = File.read("VERSION")
  spec.summary     = "PsCore's style guide for Ruby."
  spec.description = "Gem containing the rubocop.yml config that corresponds to " \
    "the implementation of the PsCore style guide for Ruby."

  spec.license = "MIT"

  spec.author   = "PsCore"
  spec.homepage = "https://github.com/telus-agcg/ps-core-ruby-styles"

  spec.files = Dir["*.yml"]

  spec.metadata = {
    "source_code_uri" => "https://github.com/telus-agcg/ps-core-ruby-styles/tree/v#{spec.version}",
  }

  spec.required_ruby_version = ">= 3.2"

  spec.add_dependency("rubocop")
  spec.add_dependency("rubocop-performance")
  spec.add_dependency("rubocop-rspec")

  spec.add_development_dependency("diffy")
  spec.add_development_dependency("pry-byebug")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec")
  spec.add_development_dependency("rubocop")
end
